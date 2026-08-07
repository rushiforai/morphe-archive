.class public final Ll/v2z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/mfv0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Ll/mfv0;->a:Ll/mfv0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/v2z0;->a:Ll/mfv0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ll/t2u0;[IILl/b6z0;Lcom/google/android/gms/internal/ads/zzgaa;)Ll/w2z0;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v0, v0, Ll/v2z0;->a:Ll/mfv0;

    .line 4
    .line 5
    move-object/from16 v16, v0

    .line 6
    .line 7
    new-instance v0, Ll/w2z0;

    .line 8
    .line 9
    const v13, 0x3f333333    # 0.7f

    .line 10
    .line 11
    .line 12
    const/high16 v14, 0x3f400000    # 0.75f

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const-wide/16 v5, 0x2710

    .line 16
    .line 17
    const-wide/16 v7, 0x61a8

    .line 18
    .line 19
    const/16 v11, 0x4ff

    .line 20
    .line 21
    const/16 v12, 0x2cf

    .line 22
    .line 23
    move-wide v9, v7

    .line 24
    move-object/from16 v1, p1

    .line 25
    .line 26
    move-object/from16 v2, p2

    .line 27
    .line 28
    move-object/from16 v4, p4

    .line 29
    .line 30
    move-object/from16 v15, p5

    .line 31
    .line 32
    invoke-direct/range {v0 .. v16}, Ll/w2z0;-><init>(Ll/t2u0;[IILl/b6z0;JJJIIFFLjava/util/List;Ll/mfv0;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method
