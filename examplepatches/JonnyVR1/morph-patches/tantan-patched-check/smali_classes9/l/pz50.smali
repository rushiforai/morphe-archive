.class public final synthetic Ll/pz50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qz50;


# direct methods
.method public synthetic constructor <init>(Ll/qz50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pz50;->a:Ll/qz50;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pz50;->a:Ll/qz50;

    invoke-static {p0}, Ll/qz50;->J3(Ll/qz50;)V

    return-void
.end method
