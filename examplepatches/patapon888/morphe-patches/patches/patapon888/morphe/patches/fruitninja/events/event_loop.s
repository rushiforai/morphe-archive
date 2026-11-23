    .text
    .global _start
_start:                         // 0x1e9fdec: DEBUG_SetEventScore now returns at once
    ret

// now_looped(DateTime) -> epoch seconds, like ConvertDateTimeToEpochTimestamp.
// When now is past the end of the whole bundled schedule, every listing is moved
// forward by whole loops of the schedule (its span rounded up to whole weeks).
now_looped:                     // 0x1e9fdf0
    stp  x29, x30, [sp, #-16]!
    mov  x29, sp
    bl   ToEpoch              // Utils.ConvertDateTimeToEpochTimestamp
    adrp x9, GotPage
    ldr  x9, [x9, #3280]        // &LiveOpsCalendarManager_TypeInfo
    ldr  x9, [x9]
    cbz  x9, done
    tbnz x9, #0, done           // class not initialised yet
    ldr  x9, [x9, #184]         // static fields
    cbz  x9, done
    ldr  x9, [x9]               // Instance
    cbz  x9, done
    ldr  x9, [x9, #0x28]        // m_remoteScheduleList
    cbz  x9, done
    ldr  x9, [x9, #0x30]        // m_eventListings
    cbz  x9, done
    ldr  x10, [x9, #0x10]       // _items
    ldrsw x11, [x9, #0x18]      // _size
    cbz  x10, done
    cmp  x11, #0
    b.le done
    add  x10, x10, #0x20
    mov  x12, #0x7fffffff       // min start
    mov  x13, #-0x80000000      // max end
    mov  x14, #0
scan:
    ldr  x15, [x10, x14, lsl #3]
    cbz  x15, scan_next
    ldrsw x16, [x15, #0x20]
    ldrsw x17, [x15, #0x24]
    cmp  x16, x12
    csel x12, x16, x12, lt
    cmp  x17, x13
    csel x13, x17, x13, gt
scan_next:
    add  x14, x14, #1
    cmp  x14, x11
    b.lt scan
    cmp  x0, x13
    b.le done                   // still inside the schedule the APK ships
    sub  x16, x13, x12          // span
    cmp  x16, #0
    b.le done
    mov  x17, #0x3a80
    movk x17, #0x9, lsl #16     // 604800 s = one week
    add  x16, x16, x17
    sub  x16, x16, #1
    udiv x16, x16, x17
    mul  x16, x16, x17          // period
    sub  x15, x0, x12
    udiv x15, x15, x16
    mul  x15, x15, x16          // shift
    mov  x14, #0
shift:
    ldr  x17, [x10, x14, lsl #3]
    cbz  x17, shift_next
    ldr  w12, [x17, #0x20]
    add  w12, w12, w15
    str  w12, [x17, #0x20]
    ldr  w12, [x17, #0x24]
    add  w12, w12, w15
    str  w12, [x17, #0x24]
shift_next:
    add  x14, x14, #1
    cmp  x14, x11
    b.lt shift
done:
    ldp  x29, x30, [sp], #16
    ret

// Called instead of LiveOpsEventsPlayerDataObject.SetEventId(this, 0, id) when an event
// starts: the event's saved points and claimed rewards are cleared first, so an event
// that comes round again starts fresh.
start_event:
    stp  x29, x30, [sp, #-32]!
    mov  x29, sp
    stp  x0, x2, [sp, #16]
    mov  x1, x2
    mov  x2, xzr
    bl   GetEventData              // GetEventData(this, id)
    cbz  x0, 1f
    str  xzr, [x0, #0x18]       // m_eventScore = m_claimedRewardEventScore = 0
1:
    ldp  x0, x2, [sp, #16]
    mov  w1, wzr
    mov  x3, xzr
    ldp  x29, x30, [sp], #32
    b    SetEventId              // SetEventId
