package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Notices what changed about the hero between two checks: a new adventure, back home, health low, or
 * died. Works on a small snapshot of the game's hero record that is kept between checks. Pure logic
 * (no Android APIs) so it can be checked against sample data off-device.
 *
 * The game's hero record (seen on a real account): health, isAlive, adventuresAmount and a status
 * object. While the hero is away the status has an arrival time and adventure/target and no village;
 * "at home" is read as the status naming a village the hero is in.
 */
final class HeroAlerts {

    /** Warn when health drops below this... */
    static final int LOW_HEALTH = 30;
    /** ...and only warn again after it has been back at or above this. */
    static final int REARM_HEALTH = 50;

    /** The GraphQL selection for the hero (also what the diagnostic log line shows). */
    static final String SELECTION = "hero { level health isAlive isRegenerating regenerationEndAt "
            + "adventuresAmount homeVillage { id } "
            + "status { status arrivalAt arrivalIn inVillage { id } onWayTo { id x y } adventure { id difficulty } } }";

    enum Event { ADVENTURE, HOME, LOW_HEALTH, DIED }

    /** What matters about the hero at one check. */
    static final class Snapshot {
        final boolean alive;
        final int health;
        final int adventures;
        final boolean atHome;
        /** True while a low-health warning has been given and health hasn't recovered since. */
        final boolean lowAlerted;

        Snapshot(boolean alive, int health, int adventures, boolean atHome, boolean lowAlerted) {
            this.alive = alive;
            this.health = health;
            this.adventures = adventures;
            this.atHome = atHome;
            this.lowAlerted = lowAlerted;
        }

        String toJson() {
            try {
                JSONObject o = new JSONObject();
                o.put("alive", alive);
                o.put("health", health);
                o.put("adventures", adventures);
                o.put("atHome", atHome);
                o.put("lowAlerted", lowAlerted);
                return o.toString();
            } catch (Exception e) {
                return "{}";
            }
        }

        /** Null for null or unreadable input, which means "no earlier check". */
        static Snapshot fromJson(String json) {
            if (json == null) {
                return null;
            }
            try {
                JSONObject o = new JSONObject(json);
                return new Snapshot(o.getBoolean("alive"), o.getInt("health"), o.getInt("adventures"),
                        o.getBoolean("atHome"), o.getBoolean("lowAlerted"));
            } catch (Exception e) {
                return null;
            }
        }
    }

    /** What to tell the user, and the snapshot to remember for the next check. */
    static final class Result {
        final List<Event> events;
        final Snapshot next;

        Result(List<Event> events, Snapshot next) {
            this.events = events;
            this.next = next;
        }
    }

    private HeroAlerts() {
    }

    /** The hero part of the poll response (the object under "hero"). */
    static Snapshot read(JSONObject hero) {
        JSONObject status = hero.optJSONObject("status");
        boolean atHome = status != null && status.optJSONObject("inVillage") != null;
        return new Snapshot(hero.optBoolean("isAlive", true), hero.optInt("health", 100),
                hero.optInt("adventuresAmount", 0), atHome, false);
    }

    /** Compares this check with the last one. With no earlier check nothing is reported. */
    static Result evaluate(Snapshot prev, Snapshot now) {
        List<Event> events = new ArrayList<Event>();
        boolean low;
        if (!now.alive || now.health >= REARM_HEALTH) {
            low = false;
        } else if (now.health < LOW_HEALTH) {
            low = true;
        } else {
            low = prev != null && prev.lowAlerted; // in between: keep whatever was decided
        }
        if (prev != null) {
            if (now.adventures > prev.adventures) {
                events.add(Event.ADVENTURE);
            }
            if (!prev.atHome && now.atHome && now.alive) {
                events.add(Event.HOME);
            }
            if (prev.alive && !now.alive) {
                events.add(Event.DIED);
            }
            if (now.alive && now.health < LOW_HEALTH && !prev.lowAlerted) {
                events.add(Event.LOW_HEALTH);
            }
        }
        return new Result(events, new Snapshot(now.alive, now.health, now.adventures, now.atHome, low));
    }

    static NotificationKind kindOf(Event event) {
        switch (event) {
            case ADVENTURE:
                return NotificationKind.HERO_ADVENTURE;
            case HOME:
                return NotificationKind.HERO_HOME;
            default:
                return NotificationKind.HERO_HEALTH;
        }
    }

    static String title(Event event, Snapshot now) {
        switch (event) {
            case ADVENTURE:
                return "New adventure available";
            case HOME:
                return "Your hero is back home";
            case LOW_HEALTH:
                return "Your hero's health is low";
            default:
                return "Your hero died";
        }
    }

    static String text(Event event, Snapshot now) {
        switch (event) {
            case ADVENTURE:
                return "Your hero has " + adventures(now.adventures) + " waiting.";
            case HOME:
                return "Your hero is home and ready for the next adventure (" + now.adventures + " waiting).";
            case LOW_HEALTH:
                return "Your hero is down to " + now.health + "% health.";
            default:
                return "Your hero was killed. Revive it before sending it out again.";
        }
    }

    private static String adventures(int n) {
        return n + (n == 1 ? " adventure" : " adventures");
    }
}
