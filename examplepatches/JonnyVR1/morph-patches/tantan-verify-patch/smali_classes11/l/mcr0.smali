.class public final synthetic Ll/mcr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ucr0;

.field public final synthetic b:I

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/ucr0;IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mcr0;->a:Ll/ucr0;

    .line 5
    .line 6
    iput p2, p0, Ll/mcr0;->b:I

    .line 7
    .line 8
    iput-wide p3, p0, Ll/mcr0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mcr0;->a:Ll/ucr0;

    .line 2
    .line 3
    iget v1, p0, Ll/mcr0;->b:I

    .line 4
    .line 5
    iget-wide v2, p0, Ll/mcr0;->c:J

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, v3}, Ll/ucr0;->j(IJ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
