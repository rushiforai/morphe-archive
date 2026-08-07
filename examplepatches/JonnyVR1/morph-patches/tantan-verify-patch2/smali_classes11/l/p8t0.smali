.class public final synthetic Ll/p8t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final synthetic a:Ll/p8t0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/p8t0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p8t0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/p8t0;->a:Ll/p8t0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    const-string p0, "Pinged SB successfully."

    .line 2
    .line 3
    invoke-static {p0}, Ll/v8t0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
