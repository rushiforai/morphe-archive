package com.wazemod.api;

import android.os.Bundle;

oneway interface IWazeModListener {
    void onUpdate(in Bundle snapshot) = 1;
    void onRevoked() = 2;
}
