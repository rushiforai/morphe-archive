package io.github.sabopura.morphe.extension.twitch.ui;

/** A framer-style spring ({@code stiffness}, {@code damping}, {@code mass}) with semi-implicit stepping. */
final class Spring {
    float value;
    float velocity;
    float target;
    long startsAt;
    private float stiffness = 380;
    private float damping = 34;
    private float mass = 1;

    Spring(float value) {
        this.value = value;
        target = value;
    }

    Spring tune(float stiffness, float damping, float mass) {
        this.stiffness = stiffness;
        this.damping = damping;
        this.mass = mass;
        return this;
    }

    void jump(float to) {
        value = to;
        target = to;
        velocity = 0;
    }

    boolean atRest(float delta, float speed) {
        return Math.abs(value - target) <= delta && Math.abs(velocity) <= speed;
    }

    /** Advances one frame; returns true while it is still moving and snaps to the target when not. */
    boolean step(float seconds, int substeps, float restDelta, float restSpeed) {
        float h = seconds / substeps;
        for (int i = 0; i < substeps; i++) {
            float acceleration = (-stiffness * (value - target) - damping * velocity) / mass;
            velocity += acceleration * h;
            value += velocity * h;
        }
        if (Math.abs(value - target) > restDelta || Math.abs(velocity) > restSpeed) return true;
        value = target;
        velocity = 0;
        return false;
    }
}
