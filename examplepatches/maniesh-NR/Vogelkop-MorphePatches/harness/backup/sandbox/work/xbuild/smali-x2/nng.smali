.class public final Lnng;
.super Lxvg;
.source "SourceFile"


# static fields
.field public static final b:Lnng;

.field public static final c:Lnng;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Lnng;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lxvg;-><init>(B)V

    sput-object v0, Lnng;->b:Lnng;

    new-instance v0, Lnng;

    invoke-direct {v0, v1}, Lxvg;-><init>(B)V

    sput-object v0, Lnng;->c:Lnng;

    return-void
.end method
