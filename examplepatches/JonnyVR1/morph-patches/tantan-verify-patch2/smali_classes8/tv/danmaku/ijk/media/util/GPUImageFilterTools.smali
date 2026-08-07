.class public Ltv/danmaku/ijk/media/util/GPUImageFilterTools;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterList;,
        Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;,
        Ltv/danmaku/ijk/media/util/GPUImageFilterTools$OnGpuImageFilterChosenListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Ltv/danmaku/ijk/media/util/GPUImageFilterTools$FilterType;I)Ll/jt2;
    .locals 1

    .line 1
    sget-object v0, Ltv/danmaku/ijk/media/util/GPUImageFilterTools$2;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "No filter of that type!"

    .line 13
    .line 14
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :pswitch_0
    new-instance p0, Ll/qv40;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/qv40;-><init>()V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_1
    new-instance p0, Ll/qv40;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/qv40;-><init>()V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_2
    new-instance p1, Ll/h5w;

    .line 32
    .line 33
    invoke-direct {p1, p0, p2}, Ll/h5w;-><init>(Landroid/content/Context;I)V

    .line 34
    .line 35
    .line 36
    return-object p1

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
