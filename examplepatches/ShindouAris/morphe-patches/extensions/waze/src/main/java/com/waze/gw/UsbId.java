package com.waze.gw;

/** VID/PID table required by the bundled usb-serial drivers. */
final class UsbId {
    private UsbId() { }
    static final int VENDOR_QINHENG = 0x1A86;
    static final int QINHENG_CH340 = 0x7523;
    static final int QINHENG_CH341A = 0x5523;
    static final int QINHENG_CH9102 = 0x55D2;
    static final int VENDOR_SILABS = 0x10C4;
    static final int SILABS_CP2102 = 0xEA60;
    static final int SILABS_CP2105 = 0xEA70;
    static final int SILABS_CP2108 = 0xEA71;
    static final int VENDOR_FTDI = 0x0403;
    static final int FTDI_FT232R = 0x6001;
    static final int FTDI_FT2232H = 0x6010;
    static final int FTDI_FT4232H = 0x6011;
    static final int FTDI_FT232H = 0x6014;
    static final int FTDI_FT231X = 0x6015;
    static final int VENDOR_PROLIFIC = 0x067B;
    static final int PROLIFIC_PL2303 = 0x2303;
    static final int PROLIFIC_PL2303GC = 0x23A3;
    static final int PROLIFIC_PL2303GB = 0x23A3;
    static final int PROLIFIC_PL2303GT = 0x23A3;
    static final int PROLIFIC_PL2303GL = 0x23A3;
    static final int PROLIFIC_PL2303GE = 0x23A3;
    static final int PROLIFIC_PL2303GS = 0x23A3;
}
