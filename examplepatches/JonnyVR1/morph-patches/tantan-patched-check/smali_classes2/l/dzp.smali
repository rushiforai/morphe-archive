.class public final synthetic Ll/dzp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/room/e;


# direct methods
.method public synthetic constructor <init>(Landroidx/room/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dzp;->a:Landroidx/room/e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dzp;->a:Landroidx/room/e;

    invoke-static {p0}, Landroidx/room/e;->a(Landroidx/room/e;)V

    return-void
.end method
