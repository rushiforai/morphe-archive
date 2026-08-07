.class public final synthetic Ll/xid;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yid;


# direct methods
.method public synthetic constructor <init>(Ll/yid;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xid;->a:Ll/yid;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xid;->a:Ll/yid;

    invoke-virtual {p0}, Ll/yid;->d()V

    return-void
.end method
