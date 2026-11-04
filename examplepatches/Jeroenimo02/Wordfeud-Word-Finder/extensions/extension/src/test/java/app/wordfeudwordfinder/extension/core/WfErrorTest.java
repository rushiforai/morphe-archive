package app.wordfeudwordfinder.extension.core;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class WfErrorTest {
    @Test
    public void codes() {
        assertEquals("WL-HTTP-404", WfError.wlHttp(404).code());
        assertEquals("GS-EVENT-swap", WfError.gsEvent("swap").code());
        assertEquals("MV-SERVER-illegal_move", WfError.mvServer("illegal_move").code());
        assertEquals("WL-NONE", WfError.wlNone().code());
        assertEquals("WL-NET", WfError.wlNet().code());
        assertEquals("WL-HASH", WfError.wlHash().code());
        assertEquals("WL-DISK", WfError.wlDisk().code());
        assertEquals("GS-DATA", WfError.gsData("x").code());
        assertEquals("x", WfError.gsData("x").getMessage());
        assertEquals("MV-SESSION", WfError.mvSession().code());
        assertEquals("MV-NET", WfError.mvNet().code());
    }
}
