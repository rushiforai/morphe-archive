.class public final synthetic Ll/es90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/fs90;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/fs90;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es90;->a:Ll/fs90;

    iput-boolean p2, p0, Ll/es90;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/es90;->a:Ll/fs90;

    iget-boolean p0, p0, Ll/es90;->b:Z

    invoke-static {v0, p0}, Ll/fs90;->W(Ll/fs90;Z)V

    return-void
.end method
