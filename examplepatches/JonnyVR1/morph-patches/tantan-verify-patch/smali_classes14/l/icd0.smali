.class public final synthetic Ll/icd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lcd0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/lcd0;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icd0;->a:Ll/lcd0;

    iput-object p2, p0, Ll/icd0;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/icd0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/icd0;->a:Ll/lcd0;

    iget-object v1, p0, Ll/icd0;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/icd0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/lcd0;->e0(Ll/lcd0;Ljava/lang/String;ZLcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
