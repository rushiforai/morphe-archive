.class public final synthetic Ll/th9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/th9;->a:J

    iput p3, p0, Ll/th9;->b:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/th9;->a:J

    iget p0, p0, Ll/th9;->b:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->W4(JI)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
