.class public abstract Llwi;
.super Lcom/opera/android/browser/SecurityInfo;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:Z

.field public final g:Ljava/lang/String;

.field public final h:[[B

.field public final i:Z

.field public final j:Ljava/lang/String;

.field public final k:[[B


# direct methods
.method public constructor <init>(Lnwi;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;[[BZLjava/lang/String;[[B)V
    .registers 12

    invoke-direct {p0, p1}, Lcom/opera/android/browser/SecurityInfo;-><init>(Lnwi;)V

    iput-object p2, p0, Llwi;->b:Ljava/lang/String;

    iput-object p3, p0, Llwi;->c:Ljava/lang/String;

    iput-object p4, p0, Llwi;->d:Ljava/lang/String;

    iput-boolean p5, p0, Llwi;->e:Z

    iput-boolean p6, p0, Llwi;->f:Z

    iput-object p7, p0, Llwi;->g:Ljava/lang/String;

    iput-object p8, p0, Llwi;->h:[[B

    iput-boolean p9, p0, Llwi;->i:Z

    iput-object p10, p0, Llwi;->j:Ljava/lang/String;

    iput-object p11, p0, Llwi;->k:[[B

    return-void
.end method
