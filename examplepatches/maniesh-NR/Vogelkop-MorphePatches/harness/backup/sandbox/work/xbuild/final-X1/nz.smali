.class public final Lnz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Z

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:I

.field public final h:Ljava/lang/String;

.field public final i:I

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:B


# direct methods
.method public constructor <init>(JZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 20

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    iput-wide p1, p0, Lnz;->a:J

    iput-boolean p3, p0, Lnz;->b:Z

    iput-boolean p4, p0, Lnz;->c:Z

    iput-object p5, p0, Lnz;->d:Ljava/lang/String;

    iput-object p6, p0, Lnz;->e:Ljava/lang/String;

    iput-object p7, p0, Lnz;->f:Ljava/lang/String;

    iput p8, p0, Lnz;->g:I

    iput-object p9, p0, Lnz;->h:Ljava/lang/String;

    iput p10, p0, Lnz;->i:I

    iput-object p11, p0, Lnz;->j:Ljava/lang/String;

    iput-object p12, p0, Lnz;->k:Ljava/lang/String;

    iput-object p13, p0, Lnz;->l:Ljava/lang/String;

    iput-object p14, p0, Lnz;->m:Ljava/lang/String;

    move-object/from16 p1, p15

    iput-object p1, p0, Lnz;->n:Ljava/lang/String;

    move-object/from16 p1, p16

    iput-object p1, p0, Lnz;->o:Ljava/lang/String;

    move-object/from16 p1, p17

    iput-object p1, p0, Lnz;->p:Ljava/lang/String;

    move/from16 p1, p18

    iput-byte p1, p0, Lnz;->q:B

    return-void
.end method
