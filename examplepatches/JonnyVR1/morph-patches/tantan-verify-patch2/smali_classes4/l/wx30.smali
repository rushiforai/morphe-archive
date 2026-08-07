.class public final synthetic Ll/wx30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/b240;

.field public final synthetic b:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/b240;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wx30;->a:Ll/b240;

    iput-object p2, p0, Ll/wx30;->b:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wx30;->a:Ll/b240;

    iget-object p0, p0, Ll/wx30;->b:Lrx/subjects/a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/b240;->D0(Ll/b240;Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method
