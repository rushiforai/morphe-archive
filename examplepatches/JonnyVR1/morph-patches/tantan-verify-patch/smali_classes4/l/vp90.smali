.class public final synthetic Ll/vp90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wp90;


# direct methods
.method public synthetic constructor <init>(Ll/wp90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vp90;->a:Ll/wp90;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vp90;->a:Ll/wp90;

    invoke-static {p0}, Ll/wp90;->s(Ll/wp90;)V

    return-void
.end method
