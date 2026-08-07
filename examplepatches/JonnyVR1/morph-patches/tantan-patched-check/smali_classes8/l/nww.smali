.class public final synthetic Ll/nww;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sww;


# direct methods
.method public synthetic constructor <init>(Ll/sww;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nww;->a:Ll/sww;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nww;->a:Ll/sww;

    invoke-static {p0}, Ll/sww;->d(Ll/sww;)V

    return-void
.end method
