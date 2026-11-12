.class public final Lo1j;
.super Lm4;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Le4j;


# direct methods
.method public constructor <init>(ILe4j;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lo1j;->a:I

    iput-object p2, p0, Lo1j;->b:Le4j;

    return-void
.end method


# virtual methods
.method public final h()V
    .registers 2

    iget-object v0, p0, Lo1j;->b:Le4j;

    invoke-super {p0, v0}, Lm4;->set(Ljava/lang/Object;)Z

    return-void
.end method
