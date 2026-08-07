.class public final synthetic Ll/y480;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q580;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/q580;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y480;->a:Ll/q580;

    iput-object p2, p0, Ll/y480;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y480;->a:Ll/q580;

    iget-object p0, p0, Ll/y480;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/q580;->M3(Ll/q580;Ljava/util/List;)V

    return-void
.end method
