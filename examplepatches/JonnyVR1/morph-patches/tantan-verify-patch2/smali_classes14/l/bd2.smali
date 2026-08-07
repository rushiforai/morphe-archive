.class public final synthetic Ll/bd2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dd2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/dd2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bd2;->a:Ll/dd2;

    iput-boolean p2, p0, Ll/bd2;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bd2;->a:Ll/dd2;

    iget-boolean p0, p0, Ll/bd2;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

    invoke-static {v0, p0, p1}, Ll/dd2;->h0(Ll/dd2;ZLcom/p1/mobile/putong/core/data/AppealInfo;)V

    return-void
.end method
