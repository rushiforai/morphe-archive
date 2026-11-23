package patapon888.morphe.patches.fruitninja.events

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

// LiveOpsEventManager.DEBUG_SetEventScore, a debug cheat never called in the release game.
// Its first 312 bytes hold the code below; event_loop.s next to this file is its source.
private const val DEBUG_SET_EVENT_SCORE = 0x1E9FDECL
private const val ORIGINAL =
    "ff8302d1 fd7b04a9 fc6f05a9 fa6706a9 f85f07a9 f65708a9 f44f09a9 151f0190 " +
    "a85a7239 f303012a f40300aa 88040037 600501d0 004446f9 0566f297 600501d0 " +
    "000c41f9 0266f297 600501d0 008046f9 ff65f297 600501d0 008446f9 fc65f297 " +
    "600501d0 008846f9 f965f297 600501d0 005c46f9 f665f297 600501d0 009046f9 " +
    "f365f297 600501d0 009846f9 f065f297 600501d0 00a046f9 ed65f297 600501d0 " +
    "00b446f9 ea65f297 60050190 000c40f9 e765f297 28008052 a85a3239 ff7f02a9 " +
    "ff1b00f9 88c24339 48130034 e0031faa 0bfdf797 001400b4 680501d0 085d46f9 " +
    "010140f9 f6430994 601300b4 817e40f9 e2031faa f50300aa 4d39f897 1f00136b " +
    "80110054 817e40f9 f803002a e00315aa e203132a e3031faa 8339f897 1f03136b " +
    "cd000054 817e40f9 e00315aa e203132a e3031faa 413af897"

private const val EVENT_LOOP =
    "c0035fd6 fd7bbfa9 fd030091 1137fb97 690501d0 296946f9 290140f9 090700b4 " +
    "e9060037 295d40f9 a90600b4 290140f9 690600b4 291540f9 290600b4 291940f9 " +
    "e90500b4 2a0940f9 2b1980b9 8a0500b4 7f0100f1 4d050054 4a810091 ec7b40b2 " +
    "ed8361b2 0e0080d2 4f796ef8 ef0000b4 f02180b9 f12580b9 1f020ceb 0cb28c9a " +
    "3f020deb 2dc28d9a ce050091 df010beb cbfeff54 1f000deb 2d030054 b0010ccb " +
    "1f0200f1 cd020054 115087d2 3101a0f2 1002118b 100600d1 100ad19a 107e119b " +
    "0f000ccb ef09d09a ef7d109b 0e0080d2 51796ef8 f10000b4 2c2240b9 8c010f0b " +
    "2c2200b9 2c2640b9 8c010f0b 2c2600b9 ce050091 df010beb cbfeff54 fd7bc1a8 " +
    "c0035fd6 fd7bbea9 fd030091 e00b01a9 e10302aa e2031faa 9d39f897 400000b4 " +
    "1f0c00f9 e00b41a9 e1031f2a e3031faa fd7bc2a8 0139f817"

@Suppress("unused")
val loopEventsPatch = resourcePatch(
    name = "Loop events",
    description = "Events keep coming offline: once the event calendar the app came with is over, " +
        "it starts again from the first event, and each event starts with its points and rewards reset. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                LibraryEdit(DEBUG_SET_EVENT_SCORE, ORIGINAL, EVENT_LOOP),
                // Every LiveOpsCalendarManager time check reads the time through now_looped (0x1E9FDF0)
                // instead of ConvertDateTimeToEpochTimestamp: the same epoch seconds, but once they are past
                // the end of the calendar the APK ships with, every event listing is first moved forward by
                // whole loops of it (its span rounded up to whole weeks).
                LibraryEdit(0x1E96BDC, "985bfb97", "85240094"), // GetActiveEvent
                LibraryEdit(0x1E97310, "cb59fb97", "b8220094"), // GetEventProgress
                LibraryEdit(0x1E973CC, "9c59fb97", "89220094"), // GetEventProgressSeconds
                LibraryEdit(0x1E977BC, "a058fb97", "8d210094"), // GetSecondsToEventEnd
                LibraryEdit(0x1E969C4, "1e5cfb97", "0b250094"), // IsEventWithinActiveTime
                LibraryEdit(0x1E96A8C, "ec5bfb97", "d9240094"), // IsEventWithinComingSoonTime
                LibraryEdit(0x1E96740, "bf5cfb97", "ac250094"), // UpdateTimersDataSource
                LibraryEdit(0x1E95884, "6e60fb97", "5b290094"), // UpdateTimersDataSources
                // LiveOpsEventManager, when an event starts: bl SetEventId -> bl start_event (0x1E9FEF0),
                // which clears the event's saved points and claimed rewards first.
                LibraryEdit(0x1C346C8, "17e70194", "0aae0994"),
            )
        )
    }
}
