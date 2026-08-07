.class public final synthetic Ll/on10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sn10;


# direct methods
.method public synthetic constructor <init>(Ll/sn10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/on10;->a:Ll/sn10;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/on10;->a:Ll/sn10;

    invoke-static {p0}, Ll/sn10;->J3(Ll/sn10;)V

    return-void
.end method
