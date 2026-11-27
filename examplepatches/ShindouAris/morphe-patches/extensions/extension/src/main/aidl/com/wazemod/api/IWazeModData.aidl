package com.wazemod.api;

import android.os.Bundle;
import com.wazemod.api.IWazeModListener;

interface IWazeModData {
    int getApiVersion() = 1;
    Bundle getSnapshot() = 2;
    void registerListener(IWazeModListener listener) = 3;
    void unregisterListener(IWazeModListener listener) = 4;
}
