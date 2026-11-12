.class public final synthetic Ln2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ln2g;->a:J

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 4

    check-cast p1, Ll2g;

    iget-wide v0, p1, Ll2g;->h:J

    iget-wide p0, p0, Ln2g;->a:J

    cmp-long p0, v0, p0

    if-lez p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method
