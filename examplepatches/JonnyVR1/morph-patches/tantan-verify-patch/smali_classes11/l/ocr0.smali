.class public final synthetic Ll/ocr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ucr0;

.field public final synthetic b:J

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/ucr0;JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ocr0;->a:Ll/ucr0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ocr0;->b:J

    .line 7
    .line 8
    iput p4, p0, Ll/ocr0;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ocr0;->a:Ll/ucr0;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/ocr0;->b:J

    .line 4
    .line 5
    iget p0, p0, Ll/ocr0;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2, p0}, Ll/ucr0;->n(JI)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
