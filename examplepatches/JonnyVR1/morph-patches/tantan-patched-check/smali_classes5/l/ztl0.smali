.class public final synthetic Ll/ztl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/eul0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/eul0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ztl0;->a:Ll/eul0;

    iput-boolean p2, p0, Ll/ztl0;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztl0;->a:Ll/eul0;

    iget-boolean p0, p0, Ll/ztl0;->b:Z

    invoke-static {v0, p0}, Ll/eul0;->l(Ll/eul0;Z)V

    return-void
.end method
