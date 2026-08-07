.class public final synthetic Ll/dww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/eww;


# direct methods
.method public synthetic constructor <init>(Ll/eww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dww;->a:Ll/eww;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dww;->a:Ll/eww;

    invoke-static {p0}, Ll/eww;->h0(Ll/eww;)V

    return-void
.end method
