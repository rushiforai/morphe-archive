.class public final synthetic Ll/pid0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qid0;


# direct methods
.method public synthetic constructor <init>(Ll/qid0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pid0;->a:Ll/qid0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pid0;->a:Ll/qid0;

    invoke-static {p0}, Ll/qid0;->j(Ll/qid0;)V

    return-void
.end method
