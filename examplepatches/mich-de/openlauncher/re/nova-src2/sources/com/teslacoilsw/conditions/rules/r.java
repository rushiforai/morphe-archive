package com.teslacoilsw.conditions.rules;

import com.teslacoilsw.conditions.rules.ConditionModel;
import kotlin.NoWhenBranchMatchedException;

/* loaded from: classes4.dex */
public abstract class r {
    public static final kx.c a(ConditionModel conditionModel) {
        if (conditionModel instanceof ConditionModel.TimeOfDayHourRangeModel) {
            return new t((ConditionModel.TimeOfDayHourRangeModel) conditionModel);
        }
        if (conditionModel instanceof ConditionModel.TimeOfDayDurationModel) {
            return new s((ConditionModel.TimeOfDayDurationModel) conditionModel);
        }
        if (conditionModel instanceof ConditionModel.WeatherChangeModel) {
            return new u((ConditionModel.WeatherChangeModel) conditionModel);
        }
        if (conditionModel instanceof ConditionModel.WifiConnectedModel) {
            return new v((ConditionModel.WifiConnectedModel) conditionModel);
        }
        if (conditionModel instanceof ConditionModel.BluetoothConnectedModel) {
            return new a((ConditionModel.BluetoothConnectedModel) conditionModel);
        }
        throw new NoWhenBranchMatchedException();
    }
}
