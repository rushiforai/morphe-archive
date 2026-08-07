.class public abstract Ll/atd$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/atd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/atd$h$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/atd$h<",
        "TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Ll/dfj0;

.field public final c:I

.field public final d:Lcom/google/android/exoplayer2/k;


# direct methods
.method public constructor <init>(ILl/dfj0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/atd$h;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/atd$h;->b:Ll/dfj0;

    .line 7
    .line 8
    iput p3, p0, Ll/atd$h;->c:I

    .line 9
    .line 10
    invoke-virtual {p2, p3}, Ll/dfj0;->c(I)Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/atd$h;->d:Lcom/google/android/exoplayer2/k;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b(Ll/atd$h;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
