.class public final synthetic Ll/xy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hz3;

.field public final synthetic b:Ll/y34;


# direct methods
.method public synthetic constructor <init>(Ll/hz3;Ll/y34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xy3;->a:Ll/hz3;

    iput-object p2, p0, Ll/xy3;->b:Ll/y34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xy3;->a:Ll/hz3;

    iget-object p0, p0, Ll/xy3;->b:Ll/y34;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    invoke-static {v0, p0, p1}, Ll/hz3;->M3(Ll/hz3;Ll/y34;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    return-void
.end method
