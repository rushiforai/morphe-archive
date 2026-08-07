.class public final synthetic Ll/rtl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/eul0;


# direct methods
.method public synthetic constructor <init>(Ll/eul0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rtl0;->a:Ll/eul0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rtl0;->a:Ll/eul0;

    invoke-static {p0}, Ll/eul0;->q(Ll/eul0;)V

    return-void
.end method
