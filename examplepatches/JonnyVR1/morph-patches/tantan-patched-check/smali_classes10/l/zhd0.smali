.class public final synthetic Ll/zhd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qid0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/qid0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zhd0;->a:Ll/qid0;

    iput-boolean p2, p0, Ll/zhd0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zhd0;->a:Ll/qid0;

    iget-boolean p0, p0, Ll/zhd0;->b:Z

    invoke-static {v0, p0, p1}, Ll/qid0;->c(Ll/qid0;ZLjava/lang/Object;)V

    return-void
.end method
