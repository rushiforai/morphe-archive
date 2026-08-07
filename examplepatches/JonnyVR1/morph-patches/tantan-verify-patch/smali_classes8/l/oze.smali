.class public Ll/oze;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oze$a;
    }
.end annotation


# static fields
.field public static final a:Ljava/util/regex/Pattern;

.field public static final b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final i:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/oze$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 29

    .line 1
    const-string v0, "\\[(.*?)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Ll/oze;->a:Ljava/util/regex/Pattern;

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Ll/oze;->b:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Ll/oze;->c:Ljava/util/ArrayList;

    .line 4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Ll/oze;->d:Ljava/util/ArrayList;

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Ll/oze;->e:Ljava/util/ArrayList;

    .line 6
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Ll/oze;->f:Ljava/util/ArrayList;

    .line 7
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Ll/oze;->g:Ljava/util/Map;

    .line 8
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Ll/oze;->h:Ljava/util/Map;

    .line 9
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    sput-object v2, Ll/oze;->i:Ljava/util/Set;

    .line 10
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Ll/oze;->j:Ljava/util/Map;

    .line 11
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->B6:I

    sget v4, Ll/abc0;->o5:I

    sget v5, Ll/abc0;->p5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->p5:I

    sget v4, Ll/abc0;->U3:I

    sget v5, Ll/abc0;->V3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->S4:I

    sget v4, Ll/abc0;->s3:I

    sget v5, Ll/abc0;->t3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->R4:I

    sget v4, Ll/abc0;->q3:I

    sget v5, Ll/abc0;->p3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->Q4:I

    sget v4, Ll/abc0;->o3:I

    sget v5, Ll/abc0;->p3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->I6:I

    sget v4, Ll/abc0;->y5:I

    sget v5, Ll/abc0;->z5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->I5:I

    sget v4, Ll/abc0;->t4:I

    sget v5, Ll/abc0;->s4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->L6:I

    sget v4, Ll/abc0;->G5:I

    sget v5, Ll/abc0;->H5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->U6:I

    sget v4, Ll/abc0;->U5:I

    sget v5, Ll/abc0;->V5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->a5:I

    sget v4, Ll/abc0;->z3:I

    sget v5, Ll/abc0;->y3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->E5:I

    sget v4, Ll/abc0;->o4:I

    sget v5, Ll/abc0;->p4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->W6:I

    sget v4, Ll/abc0;->W5:I

    sget v5, Ll/abc0;->X5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->f5:I

    sget v4, Ll/abc0;->E3:I

    sget v5, Ll/abc0;->F3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->P5:I

    sget v4, Ll/abc0;->A4:I

    sget v5, Ll/abc0;->B4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->F6:I

    sget v4, Ll/abc0;->u5:I

    sget v5, Ll/abc0;->v5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->r5:I

    sget v4, Ll/abc0;->W3:I

    sget v5, Ll/abc0;->X3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->w5:I

    sget v4, Ll/abc0;->a4:I

    sget v5, Ll/abc0;->b4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->b6:I

    sget v4, Ll/abc0;->M4:I

    sget v5, Ll/abc0;->N4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->M6:I

    sget v4, Ll/abc0;->I5:I

    sget v5, Ll/abc0;->J5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->e7:I

    sget v4, Ll/abc0;->i6:I

    sget v5, Ll/abc0;->j6:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->j5:I

    sget v4, Ll/abc0;->M3:I

    sget v5, Ll/abc0;->N3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->t5:I

    sget v4, Ll/abc0;->Y3:I

    sget v5, Ll/abc0;->Z3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->t6:I

    sget v4, Ll/abc0;->e5:I

    sget v5, Ll/abc0;->f5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->j6:I

    sget v4, Ll/abc0;->Y4:I

    sget v5, Ll/abc0;->Z4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->u6:I

    sget v4, Ll/abc0;->g5:I

    sget v5, Ll/abc0;->h5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->A5:I

    sget v4, Ll/abc0;->g4:I

    sget v5, Ll/abc0;->h4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->Q6:I

    sget v4, Ll/abc0;->O5:I

    sget v5, Ll/abc0;->P5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->z6:I

    sget v4, Ll/abc0;->k5:I

    sget v5, Ll/abc0;->l5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->J5:I

    sget v4, Ll/abc0;->u4:I

    sget v5, Ll/abc0;->v4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->c5:I

    sget v4, Ll/abc0;->C3:I

    sget v5, Ll/abc0;->D3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->H6:I

    sget v4, Ll/abc0;->w5:I

    sget v5, Ll/abc0;->x5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->c6:I

    sget v4, Ll/abc0;->O4:I

    sget v5, Ll/abc0;->P4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->g5:I

    sget v4, Ll/abc0;->G3:I

    sget v5, Ll/abc0;->H3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->x5:I

    sget v4, Ll/abc0;->c4:I

    sget v5, Ll/abc0;->d4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->S6:I

    sget v4, Ll/abc0;->Q5:I

    sget v5, Ll/abc0;->R5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->T4:I

    sget v4, Ll/abc0;->u3:I

    sget v5, Ll/abc0;->v3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->U4:I

    sget v4, Ll/abc0;->w3:I

    sget v5, Ll/abc0;->x3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->c7:I

    sget v4, Ll/abc0;->e6:I

    sget v5, Ll/abc0;->f6:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->g6:I

    sget v4, Ll/abc0;->U4:I

    sget v5, Ll/abc0;->V4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->b7:I

    sget v4, Ll/abc0;->c6:I

    sget v5, Ll/abc0;->d6:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->p6:I

    sget v4, Ll/abc0;->a5:I

    sget v5, Ll/abc0;->b5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->C6:I

    sget v4, Ll/abc0;->q5:I

    sget v5, Ll/abc0;->r5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->i6:I

    sget v4, Ll/abc0;->W4:I

    sget v5, Ll/abc0;->X4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->s6:I

    sget v4, Ll/abc0;->c5:I

    sget v5, Ll/abc0;->d5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->Y6:I

    sget v4, Ll/abc0;->Y5:I

    sget v5, Ll/abc0;->Z5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->k5:I

    sget v4, Ll/abc0;->O3:I

    sget v5, Ll/abc0;->P3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->X5:I

    sget v4, Ll/abc0;->I4:I

    sget v5, Ll/abc0;->J4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->d7:I

    sget v4, Ll/abc0;->g6:I

    sget v5, Ll/abc0;->h6:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->F5:I

    sget v4, Ll/abc0;->q4:I

    sget v5, Ll/abc0;->r4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->z5:I

    sget v4, Ll/abc0;->e4:I

    sget v5, Ll/abc0;->f4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->A6:I

    sget v4, Ll/abc0;->m5:I

    sget v5, Ll/abc0;->n5:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->L5:I

    sget v4, Ll/abc0;->x4:I

    sget v5, Ll/abc0;->w4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->b5:I

    sget v4, Ll/abc0;->A3:I

    sget v5, Ll/abc0;->B3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->U5:I

    sget v4, Ll/abc0;->E4:I

    sget v5, Ll/abc0;->H4:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    new-instance v2, Ll/oze$a;

    sget v3, Lcom/p1/mobile/android/R$string;->o5:I

    sget v4, Ll/abc0;->S3:I

    sget v5, Ll/abc0;->T3:I

    invoke-direct {v2, v3, v4, v5}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    invoke-static {}, Ll/oze;->j()V

    .line 67
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/oze$a;

    .line 68
    sget-object v2, Ll/oze;->g:Ljava/util/Map;

    iget-object v3, v1, Ll/oze$a;->e:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 69
    :cond_0
    sget-object v0, Ll/oze;->d:Ljava/util/ArrayList;

    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D6:I

    sget v3, Ll/abc0;->s5:I

    sget v4, Ll/abc0;->t5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p6:I

    sget v3, Ll/abc0;->a5:I

    sget v4, Ll/abc0;->b5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K3:I

    sget v3, Ll/abc0;->Q:I

    sget v4, Ll/abc0;->R:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J6:I

    sget v3, Ll/abc0;->C5:I

    sget v4, Ll/abc0;->D5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N5:I

    sget v3, Ll/abc0;->y4:I

    sget v4, Ll/abc0;->z4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p5:I

    sget v3, Ll/abc0;->U3:I

    sget v4, Ll/abc0;->V3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n7:I

    sget v3, Ll/abc0;->W1:I

    sget v4, Ll/abc0;->X1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V5:I

    sget v3, Ll/abc0;->F4:I

    sget v4, Ll/abc0;->G4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q3:I

    sget v3, Ll/abc0;->c0:I

    sget v4, Ll/abc0;->d0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B3:I

    sget v3, Ll/abc0;->A5:I

    sget v4, Ll/abc0;->B5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S4:I

    sget v3, Ll/abc0;->s3:I

    sget v4, Ll/abc0;->t3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R4:I

    sget v3, Ll/abc0;->q3:I

    sget v4, Ll/abc0;->r3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C3:I

    sget v3, Ll/abc0;->A:I

    sget v4, Ll/abc0;->B:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v5:I

    sget v3, Ll/abc0;->Q4:I

    sget v4, Ll/abc0;->R4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I7:I

    sget v3, Ll/abc0;->m2:I

    sget v4, Ll/abc0;->n2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z3:I

    sget v3, Ll/abc0;->u0:I

    sget v4, Ll/abc0;->v0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C5:I

    sget v3, Ll/abc0;->m4:I

    sget v4, Ll/abc0;->n4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q4:I

    sget v3, Ll/abc0;->o3:I

    sget v4, Ll/abc0;->p3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o8:I

    sget v3, Ll/abc0;->c3:I

    sget v4, Ll/abc0;->d3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m8:I

    sget v3, Ll/abc0;->a3:I

    sget v4, Ll/abc0;->b3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P5:I

    sget v3, Ll/abc0;->A4:I

    sget v4, Ll/abc0;->B4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F7:I

    sget v3, Ll/abc0;->k2:I

    sget v4, Ll/abc0;->l2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a8:I

    sget v3, Ll/abc0;->Q2:I

    sget v4, Ll/abc0;->R2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P7:I

    sget v3, Ll/abc0;->w2:I

    sget v4, Ll/abc0;->x2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j6:I

    sget v3, Ll/abc0;->Y4:I

    sget v4, Ll/abc0;->Z4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z7:I

    sget v3, Ll/abc0;->O2:I

    sget v4, Ll/abc0;->P2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P3:I

    sget v3, Ll/abc0;->a0:I

    sget v4, Ll/abc0;->b0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c5:I

    sget v3, Ll/abc0;->C3:I

    sget v4, Ll/abc0;->D3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r8:I

    sget v3, Ll/abc0;->g3:I

    sget v4, Ll/abc0;->h3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I3:I

    sget v3, Ll/abc0;->M:I

    sget v4, Ll/abc0;->N:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T7:I

    sget v3, Ll/abc0;->C2:I

    sget v4, Ll/abc0;->D2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c4:I

    sget v3, Ll/abc0;->A0:I

    sget v4, Ll/abc0;->B0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q7:I

    sget v3, Ll/abc0;->Y1:I

    sget v4, Ll/abc0;->Z1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m4:I

    sget v3, Ll/abc0;->T0:I

    sget v4, Ll/abc0;->U0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S6:I

    sget v3, Ll/abc0;->Q5:I

    sget v4, Ll/abc0;->R5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M7:I

    sget v3, Ll/abc0;->c6:I

    sget v4, Ll/abc0;->d6:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C6:I

    sget v3, Ll/abc0;->q5:I

    sget v4, Ll/abc0;->r5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q5:I

    sget v3, Ll/abc0;->C4:I

    sget v4, Ll/abc0;->D4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y6:I

    sget v3, Ll/abc0;->Y5:I

    sget v4, Ll/abc0;->Z5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d8:I

    sget v3, Ll/abc0;->S2:I

    sget v4, Ll/abc0;->T2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b4:I

    sget v3, Ll/abc0;->y0:I

    sget v4, Ll/abc0;->z0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T6:I

    sget v3, Ll/abc0;->S5:I

    sget v4, Ll/abc0;->T5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N7:I

    sget v3, Ll/abc0;->s2:I

    sget v4, Ll/abc0;->t2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s8:I

    sget v3, Ll/abc0;->i3:I

    sget v4, Ll/abc0;->j3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g8:I

    sget v3, Ll/abc0;->W2:I

    sget v4, Ll/abc0;->X2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d7:I

    sget v3, Ll/abc0;->g6:I

    sget v4, Ll/abc0;->h6:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q8:I

    sget v3, Ll/abc0;->e3:I

    sget v4, Ll/abc0;->f3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p4:I

    sget v3, Ll/abc0;->Z0:I

    sget v4, Ll/abc0;->a1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D7:I

    sget v3, Ll/abc0;->i2:I

    sget v4, Ll/abc0;->j2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->k4:I

    sget v3, Ll/abc0;->Q0:I

    sget v4, Ll/abc0;->d1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e8:I

    sget v3, Ll/abc0;->U2:I

    sget v4, Ll/abc0;->V2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l5:I

    sget v3, Ll/abc0;->Q3:I

    sget v4, Ll/abc0;->R3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H3:I

    sget v3, Ll/abc0;->K:I

    sget v4, Ll/abc0;->L:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M3:I

    sget v3, Ll/abc0;->U:I

    sget v4, Ll/abc0;->V:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N3:I

    sget v3, Ll/abc0;->W:I

    sget v4, Ll/abc0;->X:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O3:I

    sget v3, Ll/abc0;->Y:I

    sget v4, Ll/abc0;->Z:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R3:I

    sget v3, Ll/abc0;->e0:I

    sget v4, Ll/abc0;->f0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S3:I

    sget v3, Ll/abc0;->g0:I

    sget v4, Ll/abc0;->h0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T3:I

    sget v3, Ll/abc0;->i0:I

    sget v4, Ll/abc0;->j0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U3:I

    sget v3, Ll/abc0;->k0:I

    sget v4, Ll/abc0;->l0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V3:I

    sget v3, Ll/abc0;->m0:I

    sget v4, Ll/abc0;->n0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u5:I

    sget v3, Ll/abc0;->k4:I

    sget v4, Ll/abc0;->l4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X3:I

    sget v3, Ll/abc0;->q0:I

    sget v4, Ll/abc0;->r0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a4:I

    sget v3, Ll/abc0;->w0:I

    sget v4, Ll/abc0;->x0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d4:I

    sget v3, Ll/abc0;->C0:I

    sget v4, Ll/abc0;->D0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X5:I

    sget v3, Ll/abc0;->I4:I

    sget v4, Ll/abc0;->J4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R7:I

    sget v3, Ll/abc0;->A2:I

    sget v4, Ll/abc0;->B2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b5:I

    sget v3, Ll/abc0;->A3:I

    sget v4, Ll/abc0;->B3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e4:I

    sget v3, Ll/abc0;->E0:I

    sget v4, Ll/abc0;->F0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j4:I

    sget v3, Ll/abc0;->O0:I

    sget v4, Ll/abc0;->P0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l4:I

    sget v3, Ll/abc0;->R0:I

    sget v4, Ll/abc0;->S0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n4:I

    sget v3, Ll/abc0;->V0:I

    sget v4, Ll/abc0;->W0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r4:I

    sget v3, Ll/abc0;->b1:I

    sget v4, Ll/abc0;->c1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s4:I

    sget v3, Ll/abc0;->e1:I

    sget v4, Ll/abc0;->f1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t4:I

    sget v3, Ll/abc0;->g1:I

    sget v4, Ll/abc0;->h1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u4:I

    sget v3, Ll/abc0;->i1:I

    sget v4, Ll/abc0;->j1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v4:I

    sget v3, Ll/abc0;->k1:I

    sget v4, Ll/abc0;->l1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->x4:I

    sget v3, Ll/abc0;->o1:I

    sget v4, Ll/abc0;->p1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O5:I

    sget v3, Ll/abc0;->u2:I

    sget v4, Ll/abc0;->v2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C4:I

    sget v3, Ll/abc0;->y1:I

    sget v4, Ll/abc0;->z1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D4:I

    sget v3, Ll/abc0;->A1:I

    sget v4, Ll/abc0;->B1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E4:I

    sget v3, Ll/abc0;->C1:I

    sget v4, Ll/abc0;->D1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M4:I

    sget v3, Ll/abc0;->S1:I

    sget v4, Ll/abc0;->T1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N4:I

    sget v3, Ll/abc0;->U1:I

    sget v4, Ll/abc0;->V1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y4:I

    sget v3, Ll/abc0;->q1:I

    sget v4, Ll/abc0;->r1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F4:I

    sget v3, Ll/abc0;->E1:I

    sget v4, Ll/abc0;->F1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L4:I

    sget v3, Ll/abc0;->Q1:I

    sget v4, Ll/abc0;->R1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K4:I

    sget v3, Ll/abc0;->O1:I

    sget v4, Ll/abc0;->P1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J4:I

    sget v3, Ll/abc0;->M1:I

    sget v4, Ll/abc0;->N1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H4:I

    sget v3, Ll/abc0;->I1:I

    sget v4, Ll/abc0;->J1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I4:I

    sget v3, Ll/abc0;->K1:I

    sget v4, Ll/abc0;->L1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E3:I

    sget v3, Ll/abc0;->E:I

    sget v4, Ll/abc0;->F:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D3:I

    sget v3, Ll/abc0;->C:I

    sget v4, Ll/abc0;->D:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G3:I

    sget v3, Ll/abc0;->I:I

    sget v4, Ll/abc0;->J:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B4:I

    sget v3, Ll/abc0;->w1:I

    sget v4, Ll/abc0;->x1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g6:I

    sget v3, Ll/abc0;->U4:I

    sget v4, Ll/abc0;->V4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J3:I

    sget v3, Ll/abc0;->O:I

    sget v4, Ll/abc0;->P:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->W3:I

    sget v3, Ll/abc0;->o0:I

    sget v4, Ll/abc0;->p0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y3:I

    sget v3, Ll/abc0;->s0:I

    sget v4, Ll/abc0;->t0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F3:I

    sget v3, Ll/abc0;->G:I

    sget v4, Ll/abc0;->H:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K6:I

    sget v3, Ll/abc0;->E5:I

    sget v4, Ll/abc0;->F5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y5:I

    sget v3, Ll/abc0;->K4:I

    sget v4, Ll/abc0;->L4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q7:I

    sget v3, Ll/abc0;->y2:I

    sget v4, Ll/abc0;->z2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o6:I

    sget v3, Ll/abc0;->K2:I

    sget v4, Ll/abc0;->L2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z6:I

    sget v3, Ll/abc0;->a6:I

    sget v4, Ll/abc0;->b6:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v6:I

    sget v3, Ll/abc0;->i5:I

    sget v4, Ll/abc0;->j5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y7:I

    sget v3, Ll/abc0;->M2:I

    sget v4, Ll/abc0;->N2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d6:I

    sget v3, Ll/abc0;->S4:I

    sget v4, Ll/abc0;->T4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o4:I

    sget v3, Ll/abc0;->X0:I

    sget v4, Ll/abc0;->Y0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B5:I

    sget v3, Ll/abc0;->i4:I

    sget v4, Ll/abc0;->j4:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L3:I

    sget v3, Ll/abc0;->S:I

    sget v4, Ll/abc0;->T:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G4:I

    sget v3, Ll/abc0;->G1:I

    sget v4, Ll/abc0;->H1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P6:I

    sget v3, Ll/abc0;->M5:I

    sget v4, Ll/abc0;->N5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O6:I

    sget v3, Ll/abc0;->K5:I

    sget v4, Ll/abc0;->L5:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t7:I

    sget v3, Ll/abc0;->m3:I

    sget v4, Ll/abc0;->n3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l8:I

    sget v3, Ll/abc0;->Y2:I

    sget v4, Ll/abc0;->Z2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d5:I

    sget v3, Ll/abc0;->k3:I

    sget v4, Ll/abc0;->l3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v7:I

    sget v3, Ll/abc0;->a2:I

    sget v4, Ll/abc0;->b2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i5:I

    sget v3, Ll/abc0;->K3:I

    sget v4, Ll/abc0;->L3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L7:I

    sget v3, Ll/abc0;->q2:I

    sget v4, Ll/abc0;->r2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B7:I

    sget v3, Ll/abc0;->g2:I

    sget v4, Ll/abc0;->h2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h4:I

    sget v3, Ll/abc0;->K0:I

    sget v4, Ll/abc0;->L0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g4:I

    sget v3, Ll/abc0;->I0:I

    sget v4, Ll/abc0;->J0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K7:I

    sget v3, Ll/abc0;->o2:I

    sget v4, Ll/abc0;->p2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i4:I

    sget v3, Ll/abc0;->M0:I

    sget v4, Ll/abc0;->N0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V7:I

    sget v3, Ll/abc0;->I2:I

    sget v4, Ll/abc0;->J2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y7:I

    sget v3, Ll/abc0;->e2:I

    sget v4, Ll/abc0;->f2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h5:I

    sget v3, Ll/abc0;->I3:I

    sget v4, Ll/abc0;->J3:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w7:I

    sget v3, Ll/abc0;->c2:I

    sget v4, Ll/abc0;->d2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U7:I

    sget v3, Ll/abc0;->E2:I

    sget v4, Ll/abc0;->F2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->f4:I

    sget v3, Ll/abc0;->G0:I

    sget v4, Ll/abc0;->H0:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h6:I

    sget v3, Ll/abc0;->G2:I

    sget v4, Ll/abc0;->H2:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->A4:I

    sget v3, Ll/abc0;->u1:I

    sget v4, Ll/abc0;->v1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w4:I

    sget v3, Ll/abc0;->m1:I

    sget v4, Ll/abc0;->n1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->z4:I

    sget v3, Ll/abc0;->s1:I

    sget v4, Ll/abc0;->t1:I

    invoke-direct {v1, v2, v3, v4}, Ll/oze$a;-><init>(III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 204
    sget-object v0, Ll/oze;->j:Ljava/util/Map;

    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Clap"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u9f13\u638c"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bertepuk Tangan"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Taper"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Applaudieren"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Applaudire"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Aplaudir"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Aplauso"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    sget v1, Lcom/p1/mobile/android/R$string;->g5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Alk\u0131\u015f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "angry"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u751f\u6c14"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30a4\u30e9\u30a4\u30e9"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u751f\u6c23"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud654\ub0a8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e42\u0e01\u0e23\u0e18"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "marah"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "f\u00e2ch\u00e9"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "ver\u00e4rgert"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "arrabbiato"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "zangado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "enfadado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    sget v1, Lcom/p1/mobile/android/R$string;->Q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sinirli"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "heart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8272"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30e1\u30ed\u30e1\u30ed"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8272"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud558\ud2b8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e2b\u0e37\u0e48\u0e19"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "hati"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "c\u0153ur"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Herz"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "cuore"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "cora\u00e7\u00e3o"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "coraz\u00f3n"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    sget v1, Lcom/p1/mobile/android/R$string;->K5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u015e\u0131mar\u0131k"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Nosepick"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u62a0\u9f3b"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u6473\u9f3b"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Mengupil"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Doigt dans le nez"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Nasenbohren"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Scaccolarsi"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Dedo no nariz"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Coger nariz"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    sget v1, Lcom/p1/mobile/android/R$string;->c6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Burun Kar\u0131\u015ft\u0131rma"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "largegasp"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u60ca\u6050"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u3073\u3063\u304f\u308a"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u9a5a\u6050"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ub2f9\ud669"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e01\u0e25\u0e31\u0e27"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "kaget"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "largegasp"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Vor Angst erstarrt"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "respiro profondo"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "grande suspiro"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "gransorpresa"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    sget v1, Lcom/p1/mobile/android/R$string;->R5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u015eok"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Hammer"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u6376\u6253"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u6376\u6253"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Palu"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Marteau"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Martello"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Martelo"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Martillo"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    sget v1, Lcom/p1/mobile/android/R$string;->J5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "D\u00f6vme"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "crazy"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u82b1\u75f4"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u30cb\u30e4\u30cb\u30e4"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u82b1\u7661"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\uc0c1\uc0c1"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u0e02\u0e35\u0e49\u0e2b\u0e25\u0e35"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "tergila-gila"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "fou"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "verr\u00fcckt"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "pazzo"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "maluco"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "loco"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    sget v1, Lcom/p1/mobile/android/R$string;->n5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u00c7i\u00e7ek Delisi"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "smirk"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "\u5475\u5475"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "\u5475\u5475"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "menyeringai"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "sourire suffisant"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "S\u00fcffisantes Grinsen"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "sorrisetto"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "sorriso matreiro"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Sonrisa"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget v1, Lcom/p1/mobile/android/R$string;->E6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "He He"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "wink"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u7728\u773c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u30a6\u30a3\u30f3\u30af"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u7728\u773c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\uc719\ud06c"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "\u0e01\u0e23\u0e30\u0e1e\u0e23\u0e34\u0e1a\u0e15\u0e32"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "kedip"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "clin d\'\u0153il"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "zwinkernd"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "occhiolino"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "piscadela"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "gui\u00f1o"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    sget v1, Lcom/p1/mobile/android/R$string;->a7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "G\u00f6z K\u0131rpma"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v6, "Sh"

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "\u5618"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "\u5653"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "Psst"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "Silenzio"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    sget v1, Lcom/p1/mobile/android/R$string;->u6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "Yalan"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 334
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v7, "Drowsy"

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v8, "\u56f0"

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 340
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Mengantuk"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Somnolent"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Schl\u00e4frig"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Assonnato"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Sonolento"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Somnoliento"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    sget v1, Lcom/p1/mobile/android/R$string;->w5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Uykulu"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "kiss"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\u4eb2\u4eb2"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\u30ad\u30b9"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\u89aa\u89aa"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\ubf40\ubf40"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\u0e08\u0e39\u0e1a"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "cium"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "bisou"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "k\u00fcssend"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "bacio"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "beijo"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "beso"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    sget v1, Lcom/p1/mobile/android/R$string;->Q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "\u00d6p\u00fcc\u00fck"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v9, "Commando"

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u5927\u5175"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u5927\u5175"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Komando"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 368
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Soldat"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Militar"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Comando"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    sget v1, Lcom/p1/mobile/android/R$string;->j5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Asker"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "veryangry"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u66b4\u8d70"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u6012\u308a"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u66b4\u8d70"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 377
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\ubd84\ub178"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u0e42\u0e01\u0e23\u0e18\u0e21\u0e32\u0e01"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "ngamuk"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 380
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "tr\u00e8s en col\u00e8re"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "w\u00fctend"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "molto arrabbiato"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "muito zangado"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "muyenfadado"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 385
    sget v1, Lcom/p1/mobile/android/R$string;->V6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Asabi"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 386
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Delicious"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u8214\u5634\u5507"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u8214\u5634\u5507"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Lezat"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "D\u00e9licieux"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Mmh, lecker"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Delizioso"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Delicioso"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Delicioso"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    sget v1, Lcom/p1/mobile/android/R$string;->r5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Dudaklar"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Determined"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u594b\u6597"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u596e\u9b25"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Bertekat bulat"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "D\u00e9termin\u00e9"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Wild entschlossen"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Determinato"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 409
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Determinado"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Decidido"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 411
    sget v1, Lcom/p1/mobile/android/R$string;->t5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "M\u00fccadele"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 412
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Hi"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u55e8"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u55e8"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Hai"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Salut"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 420
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Ciao"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Ol\u00e1"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Hola"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    sget v1, Lcom/p1/mobile/android/R$string;->M5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Selam"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 425
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Quiet"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u7981\u8a00"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 428
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u7981\u8a00"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 429
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Diam"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Silencieux"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 433
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Schweigen"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Silenzioso"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Sil\u00eancio"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Callado"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    sget v1, Lcom/p1/mobile/android/R$string;->k6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Yasakl\u0131"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Awkward"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5c34\u5c2c"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5c37\u5c2c"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 444
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Canggung"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Bizarre"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Rot vor Scham"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Imbarazzato"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Constrangido"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Torpe"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    sget v1, Lcom/p1/mobile/android/R$string;->S4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Utanma"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 451
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Faint"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u6655\u4e86"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u6688\u4e86"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 455
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Pingsan"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 458
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "S\u00e9vanouir"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Mir dreht sich der Kopf"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Svenire"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 461
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Desmaiar"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Desmayado"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    sget v1, Lcom/p1/mobile/android/R$string;->A5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Bayg\u0131n"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 464
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Moon"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u6708\u4eae"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 466
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Moon"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "\u6708\u4eae"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 468
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Moon"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Moon"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Bulan"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Lune"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Mond"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Luna"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Lua"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Luna"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    sget v1, Lcom/p1/mobile/android/R$string;->Y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Ay"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v10, "Chuckle"

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5077\u7b11"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 480
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5077\u7b11"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 483
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Tertawa Tertahan"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Glousser"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 485
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "In sich hineinlachen"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 486
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Ridacchiare"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Gargalhar"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 488
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Entredientes"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    sget v1, Lcom/p1/mobile/android/R$string;->f5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "G\u00fcl\u00fcmseme"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 490
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pig"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 491
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u732a"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u8c6c"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 496
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Babi"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cochon"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 498
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Schwein"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 499
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Maiale"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 500
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Porco"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cerdo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    sget v1, Lcom/p1/mobile/android/R$string;->e6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Domuz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "rich"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 504
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u571f\u8c6a"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 505
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u304a\u91d1\u6301\u3061"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 506
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u571f\u8c6a"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\ubd80\uc790"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e23\u0e27\u0e22"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 509
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "kaya"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "riche"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Gesicht mit Dollaraugen"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 512
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ricco"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "rico"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "rico"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    sget v1, Lcom/p1/mobile/android/R$string;->m6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Zengin"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sly"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9634\u9669"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 518
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sly"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9670\u96aa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sly"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sly"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Licik"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sournois"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 524
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hinterh\u00e4ltig"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 525
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Furbo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Dissimulado"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pillo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    sget v1, Lcom/p1/mobile/android/R$string;->C6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sinsi"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Slap"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 530
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6253\u8033\u5149"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Slap"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6253\u8033\u5149"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 533
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Slap"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Slap"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Ditampar"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Gifler"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Ohrfeige"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Schiaffo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Estalada"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bofet\u00f3n"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 541
    sget v1, Lcom/p1/mobile/android/R$string;->A6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Tokat"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Weak"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u5dee"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u5dee"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Lemah"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Faible"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 550
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Schwach (im Sinne von ungen\u00fcgend)"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 551
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Debole"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Fraco"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 553
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "D\u00e9bil"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 554
    sget v1, Lcom/p1/mobile/android/R$string;->X6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "K\u00f6t\u00fc"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 555
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Joyful"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 556
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6109\u5feb"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Joyful"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 558
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6109\u5feb"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 559
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Joyful"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Joyful"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 561
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Senang"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 562
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Joyeux"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 563
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Vergn\u00fcgt"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Gioioso"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 565
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Alegre"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Juguet\u00f3n"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    sget v1, Lcom/p1/mobile/android/R$string;->P5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Mutlu"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "yum"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u597d\u5403"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 570
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u3082\u3050\u3082\u3050"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 571
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u597d\u5403"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 572
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\ubcfc\ube75\ube75"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u0e2d\u0e23\u0e48\u0e2d\u0e22"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "yum"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 575
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "miam"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Gesicht, das schmackhaftes Essen genie\u00dft"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "slurp"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "delicioso"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "mmm"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    sget v1, Lcom/p1/mobile/android/R$string;->f7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Lezzetli"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "nerd"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u4e66\u5446\u5b50"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u3075\u3080\u3075\u3080"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u66f8\u5446\u5b50"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\ub611\ub611"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u0e40\u0e19\u0e34\u0e23\u0e4c\u0e14"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "kutu buku"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 588
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "geek"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Nerd Gesicht"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 590
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "nerd"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 591
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "tot\u00f3"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "nerd"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    sget v1, Lcom/p1/mobile/android/R$string;->a6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Kitap Kurdu"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desired"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 595
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6d41\u53e3\u6c34"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desired"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 597
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6d41\u53e3\u6c34"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desired"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desired"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Hasrat"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "D\u00e9sir\u00e9"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 602
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Lechzend"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desiderato"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 604
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Desejado"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Deseado"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    sget v1, Lcom/p1/mobile/android/R$string;->s5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Salya"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 607
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "dizzy"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6655"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 609
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u53c2\u3063\u305f"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 610
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6688"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\ud5e4\ub871"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u0e21\u0e36\u0e19"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 613
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "pusing"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 614
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u00e9tourdi"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 615
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "benommen"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 616
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "nauseato"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 617
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "tonto"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "mareado"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 619
    sget v1, Lcom/p1/mobile/android/R$string;->l5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Sersem"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 620
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Grin"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 621
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u5472\u7259"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 622
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Grin_Y"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u5472\u7259"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 624
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Grin_Y"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Grin"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 626
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Nyengir"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 627
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Grand sourire"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Z\u00e4hne zeigendes Grinsen"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 629
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Sorrisino"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Sorriso rasgado"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Sonrisa"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 632
    sget v1, Lcom/p1/mobile/android/R$string;->I5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u00c7\u00fcr\u00fck Di\u015f"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 633
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Mask"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 634
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6234\u53e3\u7f69"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 635
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Mask"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "\u6234\u53e3\u7f69"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Mask"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Mask"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Topeng"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Masque"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 641
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Gesicht mit Mundschutz"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 642
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Maschera"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 643
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "M\u00e1scara"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 644
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Enmascarado"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    sget v1, Lcom/p1/mobile/android/R$string;->X5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Maske Takma"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v13, "Smug"

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v14, "\u50b2\u6162"

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 648
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Sombong"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 653
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Suffisant"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 654
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u00dcberheblich"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 655
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Orgoglioso"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Convencido"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Engre\u00eddo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    sget v1, Lcom/p1/mobile/android/R$string;->F6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Kibirli"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "undecided"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 660
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u6487\u5634"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u60a9\u3080"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 662
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u6487\u5634"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 663
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\uc2dc\ubb34\ub8e9"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u0e41\u0e1a\u0e30\u0e1b\u0e32\u0e01"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 665
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "bingung"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "ind\u00e9cision"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "unentschlossen"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "indeciso"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 669
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "indeciso"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 670
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "indeciso"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 671
    sget v1, Lcom/p1/mobile/android/R$string;->T6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Dudak B\u00fckme"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u661f\u661f\u773c"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Star-struck"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Terpukau"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u0e15\u0e32\u0e40\u0e1b\u0e47\u0e19\u0e1b\u0e23\u0e30\u0e01\u0e32\u0e22"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u30e1\u30ac\u661f"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    sget v1, Lcom/p1/mobile/android/R$string;->B3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\ubfcc\uc789\ubfcc\uc789"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "crying"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u54ed"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u6ce3\u304d"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u54ed"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 682
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\ub208\ubb3c"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u0e23\u0e49\u0e2d\u0e07\u0e44\u0e2b\u0e49"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 684
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "nangis"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "pleurs"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "weinend"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "pianto"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "choro"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "llorando"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 690
    sget v1, Lcom/p1/mobile/android/R$string;->q5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "A\u011flama"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Cry"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u6d41\u6cea"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Cry"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u6d41\u6dda"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Cry"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Cry"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "merintih"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Pleurer"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Weinen"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Piangere"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Choro"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Llorar"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    sget v1, Lcom/p1/mobile/android/R$string;->p5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "G\u00f6zya\u015f\u0131"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Sad"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u96be\u8fc7"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 706
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u96e3\u904e"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Upset"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Triste"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Traurig"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Pedih"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    sget v1, Lcom/p1/mobile/android/R$string;->p6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "H\u00fcz\u00fcnl\u00fc"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Wilt"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u51cb\u8c22"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 714
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Wilt"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 715
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u51cb\u8b1d"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Wilt"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 717
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Wilt"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Sakit"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 719
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Se fl\u00e9trir"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Verwelkende Blume"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 721
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Appassito"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 722
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Murcho"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Marchito"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    sget v1, Lcom/p1/mobile/android/R$string;->Z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Solmu\u015f"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Unhappy"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u4e0d\u9ad8\u5174"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 727
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Unhappy"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 728
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u4e0d\u9ad8\u8208"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 729
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Unhappy"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 730
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Unhappy"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 731
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Tidak bahagia"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 732
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Malheureux"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 733
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Ungl\u00fccklich"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 734
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Infelice"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 735
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Infeliz"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Triste"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 737
    sget v1, Lcom/p1/mobile/android/R$string;->U6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Mutsuz"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 738
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "naughty"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 739
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u8c03\u76ae"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 740
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u60aa\u9b54"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 741
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u8abf\u76ae"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 742
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\uc545\ub9c8"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 743
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u0e0b\u0e19"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "nakal"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "coquin"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "frech"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 747
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "cattivo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "maroto"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "malvado"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 750
    sget v1, Lcom/p1/mobile/android/R$string;->Z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yaramaz"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 751
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yawn"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 752
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u54c8\u6b20"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 753
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yawn"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 754
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u54c8\u6b20"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 755
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yawn"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 756
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yawn"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 757
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Menguap"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 758
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "B\u00e2illement"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "G\u00e4hn!"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 760
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Sbadiglio"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 761
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Bocejo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 762
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Bostezo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 763
    sget v1, Lcom/p1/mobile/android/R$string;->c7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Esneme"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 764
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Pooh-pooh"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 765
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v16, v12

    const-string v12, "\u9119\u89c6"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 766
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 767
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9119\u8996"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 768
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 770
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Caca"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Ver\u00e4chtlich"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 773
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cacca"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 774
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Desaprovador"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 775
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 776
    sget v1, Lcom/p1/mobile/android/R$string;->g6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "A\u015fa\u011f\u0131lama"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 777
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "smile"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5fae\u7b11"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 779
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u30b9\u30de\u30a4\u30eb"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 780
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5fae\u7b11"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 781
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\uc2a4\ub9c8\uc77c"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e22\u0e34\u0e49\u0e21"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 783
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "senyum"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sourire"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 785
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "l\u00e4chelnd"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 786
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sorriso"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 787
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sorriso"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 788
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sonrisa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 789
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "G\u00fcl\u00fcmseme"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 790
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ambivalent"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 791
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u72b9\u8c6b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 792
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u3064\u307e\u3089\u306a\u3044"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u7336\u8c6b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\uc9dc\uc99d"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e25\u0e31\u0e07\u0e40\u0e25"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "bimbang"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 797
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ambivalent"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 798
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "z\u00f6gernd"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ambivalente"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 800
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ambivalente"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 801
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ambivalente"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 802
    sget v1, Lcom/p1/mobile/android/R$string;->O4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Teredd\u00fctl\u00fc"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 803
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "CrushOnYou"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 804
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u4e00\u89c1\u949f\u60c5"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 805
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 806
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u4e00\u898b\u937e\u60c5"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 807
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Crushonyou"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 809
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Jatuh cinta"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 810
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 811
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Liebe auf den ersten Blick"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 812
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Innamorato"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 813
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "EnamoradoDeTi"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 815
    sget v1, Lcom/p1/mobile/android/R$string;->o5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0130lk G\u00f6r\u00fc\u015fte A\u015fk"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 816
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "gasp"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 817
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u60ca\u8bb6"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 818
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u306a\u308b\u307b\u3069"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 819
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9a5a\u8a1d"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 820
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\ud5c9"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 821
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e41\u0e1b\u0e25\u0e01\u0e43\u0e08"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 822
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "kaget"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 823
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "surpris"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 824
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "erstaunt"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 825
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sospiro"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 826
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "suspiro"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 827
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sorpresa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    sget v1, Lcom/p1/mobile/android/R$string;->D5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "S\u00fcrpriz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 829
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "bigeyes"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u773c"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u308f\u304f\u308f\u304f"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 832
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u773c"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 833
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\uc655\ub208"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e15\u0e32\u0e42\u0e15"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "matagede"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 836
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "gros yeux"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 837
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "lachend mit gro\u00dfen Augen"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 838
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "occhioni"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 839
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "olhos grandes"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ojosgrandes"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    sget v1, Lcom/p1/mobile/android/R$string;->X4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "B\u00fcy\u00fck G\u00f6zler"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 842
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sob"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 843
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u54ed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 844
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sob"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 845
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u54ed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 846
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sob"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 847
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sob"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 848
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Terisak"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 849
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sanglot"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 850
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Laut heulen"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 851
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Singhiozzo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 852
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Solu\u00e7ar"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 853
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sollozo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 854
    sget v1, Lcom/p1/mobile/android/R$string;->G6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "A\u011flama"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 855
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Silght"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 856
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u767d\u773c"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 857
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 858
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u767d\u773c"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 859
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 860
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 861
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Mendesah"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 862
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Silence"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 863
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nach oben verdrehte Augen"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 864
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Occhi al cielo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 865
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 866
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Desprecio"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 867
    sget v1, Lcom/p1/mobile/android/R$string;->y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Beyaz G\u00f6z"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 868
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sun"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 869
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u592a\u9633"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 870
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sun"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 871
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u592a\u967d"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 872
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sun"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 873
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sun"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 874
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Matahari"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 875
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Soleil"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 876
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sonne"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 877
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sole"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 878
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sol"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 879
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Dom"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 880
    sget v1, Lcom/p1/mobile/android/R$string;->K6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "G\u00fcne\u015f"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 881
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Shake"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 882
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u63e1\u624b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 883
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Shake"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 884
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u63e1\u624b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 885
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Shake"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 886
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Shake"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 887
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Jabat tangan"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 888
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Secouer"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 889
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Handschlag"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 890
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Stretta di mano"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 891
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Aperto de m\u00e3os"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Agitado"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 893
    sget v1, Lcom/p1/mobile/android/R$string;->v6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Tokala\u015fma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 894
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "laugh"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 895
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u7b11"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 896
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u7b11\u3044"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 897
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u7b11"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 898
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\uc6c3\uc74c"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 899
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e2b\u0e31\u0e27\u0e40\u0e23\u0e32\u0e30"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 900
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ketawa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 901
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "rire"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 902
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "lachend"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 903
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "risata"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "gargalhada"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 905
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "risa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    sget v1, Lcom/p1/mobile/android/R$string;->S5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kahkaha"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 907
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomit"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5455\u5410"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 909
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomit"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5614\u5410"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomit"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 912
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomit"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Muntah"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomir"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kotzend"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 916
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Vomito"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 917
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "V\u00f3mito"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 918
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "V\u00f3mito"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 919
    sget v1, Lcom/p1/mobile/android/R$string;->W6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kusma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 920
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hug"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u62e5\u62b1"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 922
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hug"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 923
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u64c1\u62b1"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 924
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hug"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 925
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hug"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 926
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Peluk"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 927
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "C\u00e2lin"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Umarmung"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Abbraccio"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Abra\u00e7o"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 931
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Abrazo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    sget v1, Lcom/p1/mobile/android/R$string;->O5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kucakla\u015fma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 933
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bah!L"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 934
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u5de6\u54fc\u54fc"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 935
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u5de6\u54fc\u54fc"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 937
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 938
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 939
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Bah!Kr"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 941
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Ablehnend mit nach links gewandtem Gesicht"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 942
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Disprezzo S"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 943
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 944
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 945
    sget v1, Lcom/p1/mobile/android/R$string;->T4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sola K\u00fcsme"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 946
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Salute"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 947
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u62b1\u62f3"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 948
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 949
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u62b1\u62f3"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 950
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 952
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Memberi Hormat"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 953
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Salut"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 954
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Respekt erweisende Geste"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 955
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Saluto"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 956
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Sauda\u00e7\u00e3o"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 957
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Saludo"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 958
    sget v1, Lcom/p1/mobile/android/R$string;->q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Yumruk Selam\u0131"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 959
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervers"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 960
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u614c\u5f20"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 961
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervers"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 962
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "\u614c\u5f35"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 963
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervers"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 964
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervers"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 965
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Grogi"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 966
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nerfs"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 967
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Angespannt"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 968
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervosi"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 969
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervoso"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 970
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Nervios"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 971
    sget v1, Lcom/p1/mobile/android/R$string;->b6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Panik"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 972
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v15, "Scold"

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 973
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v17, v11

    const-string v11, "\u5492\u9a82"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 974
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 975
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5492\u99e1"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 976
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 977
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 978
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Marah"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 979
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Gronder"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 980
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Schimpfen"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 981
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Sgridare"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 982
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Repreender"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 983
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Gru\u00f1\u00f3n"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 984
    sget v1, Lcom/p1/mobile/android/R$string;->t6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Beddua"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 985
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "pirate"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 986
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u6d77\u76d7"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 987
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u6d77\u8cca"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 988
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u6d77\u76dc"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\ud574\uc801"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 990
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u0e42\u0e08\u0e23\u0e2a\u0e25\u0e31\u0e14"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 991
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "bajak laut"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 992
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "pirate"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 993
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pirat"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 994
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "pirata"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 995
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "pirata"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 996
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "pirata"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 997
    sget v1, Lcom/p1/mobile/android/R$string;->f6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Korsan"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 998
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Beckon"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 999
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v18, v12

    const-string v12, "\u6765"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1000
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1001
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4f86"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1003
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1004
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Memberi isyarat"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1005
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Faire signe"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Komm her!"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1007
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cenno"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1008
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Aceno"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1009
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Se\u00f1as"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1010
    sget v1, Lcom/p1/mobile/android/R$string;->V4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Gel"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1011
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Squint"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1012
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5410\u820c\u5934"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1013
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Squint"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1014
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5410\u820c\u982d"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1015
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Squint"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1016
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Squint"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1017
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Memicingkan mata"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1018
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Strabisme"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1019
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kopf mit herausgestreckter Zunge"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1020
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Strabico"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1021
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Olhos fechados"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1022
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Reojo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1023
    sget v1, Lcom/p1/mobile/android/R$string;->I6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Dil \u00c7\u0131karma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1024
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bless"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1025
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4fdd\u4f51"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1026
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bless"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1027
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4fdd\u4f51"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1028
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bless"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1029
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bless"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1030
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Diberkati"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1031
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "B\u00e9nir"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1032
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pass auf dich auf!"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1033
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Benedizione"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1034
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "B\u00ean\u00e7\u00e3o"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1035
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bendecir"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1036
    sget v1, Lcom/p1/mobile/android/R$string;->Y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kutsama"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1037
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrassed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1038
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u7cd7"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1039
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrassed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1040
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u7cd7"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1041
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrassed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1042
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrassed"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1043
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Malu"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1044
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrass\u00e9"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1045
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Besch\u00e4mt"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1046
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Imbarazzato"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1047
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Envergonhado"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1048
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Avergonzado"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1049
    sget v1, Lcom/p1/mobile/android/R$string;->x5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Tah\u0131l"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1050
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrate"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1051
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6563\u82b1"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1052
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrate"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1053
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6563\u82b1"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1054
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrate"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1055
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrate"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1056
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Merayakan"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1057
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "F\u00eate"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1058
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Feiernd"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1059
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Festa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1060
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrar"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1061
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Celebrar"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1062
    sget v1, Lcom/p1/mobile/android/R$string;->e5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u00c7i\u00e7ek Sa\u00e7ma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1063
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Question"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1064
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v19, v11

    const-string v11, "\u7591\u95ee"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1065
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1066
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u7591\u554f"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1067
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1068
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1069
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pertanyaan"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1070
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1071
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Fragend"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1072
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Domanda"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1073
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pergunta"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1074
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pregunta"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1075
    sget v1, Lcom/p1/mobile/android/R$string;->j6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u015e\u00fcpheli"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1076
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Bye"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u518d\u89c1"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1078
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Bye"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1079
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u518d\u898b"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1080
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Bye"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Bye"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1082
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Selamat tinggal"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1083
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Au revoir"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1084
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Tsch\u00fcss"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Ciao"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1086
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Adeus"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1087
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Adi\u00f3s"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1088
    sget v1, Lcom/p1/mobile/android/R$string;->c5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Ho\u015f\u00e7akal"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1089
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Speechless"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1090
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6c57"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1091
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1092
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6c57"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1093
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1094
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1095
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Terdiam"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Muet"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1097
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sprachlos"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Senza parole"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1099
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sem palavras"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1100
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sin palabras"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1101
    sget v1, Lcom/p1/mobile/android/R$string;->H6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Terli"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1102
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Suprised"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1103
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u60ca\u53f9"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1104
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Suprised"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9a5a\u6b4e"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1106
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Suprised"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1107
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Suprised"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1108
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Terkejut"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1109
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Surpris"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1110
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u00dcberrascht"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sorpreso"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Surpreso"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1113
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Sorprendido"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1114
    sget v1, Lcom/p1/mobile/android/R$string;->L6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u015ea\u015f\u0131rt\u0131c\u0131"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1115
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Poop"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1116
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u4fbf"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Poop"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1118
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5927\u4fbf"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1119
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Poop"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1120
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Poop"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1121
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kotoran"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1122
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Caca"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1123
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kothaufen"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1124
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cacca"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1125
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coc\u00f3"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Caca"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1127
    sget v1, Lcom/p1/mobile/android/R$string;->h6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "D\u0131\u015fk\u0131"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1128
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "faceplam"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1129
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4e0d\u770b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1130
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "faceplam"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1131
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4e0d\u770b"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1132
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "faceplam"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "faceplam"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "tepok jidat"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1135
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Embarrass\u00e9"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1136
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hand im Gesicht"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1137
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "mano in faccia"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1138
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "m\u00e3o na cara"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1139
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "facepalm"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1140
    sget v1, Lcom/p1/mobile/android/R$string;->z5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bakma"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1141
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "sick"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1142
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5410"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1143
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u6c17\u6301\u3061\u60aa\u3044"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1144
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5410"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1145
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\uc544\ud514"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1146
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e2d\u0e32\u0e40\u0e08\u0e35\u0e22\u0e19"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1147
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "muntah"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1148
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "malade"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1149
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "kotzend"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1150
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "malato"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1151
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "doente"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1152
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "enfermo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    sget v1, Lcom/p1/mobile/android/R$string;->x6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "T\u00fck\u00fcrme"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1154
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coolguy"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1155
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9177"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1156
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coolguy"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1157
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u9177"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1158
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coolguy"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1159
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coolguy"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1160
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Orang keren"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1161
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Gars cool"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1162
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cooler Typ"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1163
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Figo"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1164
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Fixe"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1165
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Guay"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1166
    sget v1, Lcom/p1/mobile/android/R$string;->m5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cool"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1167
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "frown"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1168
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u76b1\u7709"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1169
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u3057\u3087\u3093\u307c\u308a"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1170
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u76ba\u7709"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1171
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\ub099\ub2f4"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1172
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u0e02\u0e21\u0e27\u0e14\u0e04\u0e34\u0e49\u0e27"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1173
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "mengerut"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1174
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "froncement de sourcils"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1175
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "stirnrunzelnd"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1176
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "imbronciato"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1177
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "franzir o sobrolho"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1178
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "ce\u00f1ofruncido"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1179
    sget v1, Lcom/p1/mobile/android/R$string;->C5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Ho\u015fg\u00f6r\u00fcs\u00fcz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1180
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pout"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1181
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u4eb2"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1182
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pout"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1183
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u89aa"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1184
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pout"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1185
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pout"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1186
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Mencibir"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1187
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Moue"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1188
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "K\u00fcssend"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1189
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Broncio"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1190
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Mau humor"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1191
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Enfado"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1192
    sget v1, Lcom/p1/mobile/android/R$string;->i6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u00d6pme"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1193
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Heart"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1194
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5fc3"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1195
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Heart_Y"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1196
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5fc3"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1197
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Heart_Y"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1198
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Heart"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1199
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Hati"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1200
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "C\u0153ur"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1201
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Herz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1202
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cuore"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1203
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Cora\u00e7\u00e3o"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1204
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Coraz\u00f3n"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1205
    sget v1, Lcom/p1/mobile/android/R$string;->L5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Kalp"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1206
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Rose"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1207
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v20, v11

    const-string v11, "\u73ab\u7470"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1208
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1209
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u73ab\u7470"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1210
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1211
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1212
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Mawar"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1213
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1214
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1215
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rosa"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1216
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rosa"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1217
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rosa"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1218
    sget v1, Lcom/p1/mobile/android/R$string;->o6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "G\u00fcl"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1219
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Lips"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1220
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5507\u5370"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1221
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1222
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u5507\u5370"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1223
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1224
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1225
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Bibir"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1226
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "L\u00e8vres"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1227
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Lippenabdruck"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1228
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Labbra"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1229
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "L\u00e1bios"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1230
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Labios"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1231
    sget v1, Lcom/p1/mobile/android/R$string;->U5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Dudak \u0130zi"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1232
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Peace"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1233
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u80dc\u5229"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1234
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Peace"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1235
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "\u52dd\u5229"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1236
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Peace"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1237
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Peace"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1238
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Menang"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1239
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Paix"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1240
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Victory Handzeichen"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1241
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Pace"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1242
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Paz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1243
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Paz"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1244
    sget v1, Lcom/p1/mobile/android/R$string;->d6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Zafer"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1245
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v12, "Shy"

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1246
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v21, v11

    const-string v11, "\u5bb3\u7f9e"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1247
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1248
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5bb3\u7f9e"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1249
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1250
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1251
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Malu"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1252
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Timide"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1253
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Sch\u00fcchtern"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1254
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Timido"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1255
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "T\u00edmido"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1256
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "T\u00edmido"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1257
    sget v1, Lcom/p1/mobile/android/R$string;->w6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Utanga\u00e7"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1258
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarcastic"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1259
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u8bbd\u523a"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1260
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u4f01\u3080"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1261
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u8af7\u523a"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1262
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\uc528\uc775"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1263
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u0e40\u0e2a\u0e35\u0e22\u0e14\u0e2a\u0e35"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1264
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarkastik"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1265
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarcastique"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1266
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarkastisch"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1267
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarcastico"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1268
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarc\u00e1stico"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1269
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "sarc\u00e1stico"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1270
    sget v1, Lcom/p1/mobile/android/R$string;->r6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Hiciv"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1271
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "zipped"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1272
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u95ed\u5634"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1273
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u79d8\u5bc6"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1274
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u9589\u5634"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1275
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\uc9c0\ud37c"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1276
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u0e2b\u0e38\u0e1a\u0e1b\u0e32\u0e01"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1277
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "kunci mulut"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1278
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "zipp\u00e9"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1279
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Gesicht mit Rei\u00dfverschluss-Mund"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1280
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "bocca con zip"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1281
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "boca fechada"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1282
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "bocacerrada"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1283
    sget v1, Lcom/p1/mobile/android/R$string;->V5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Kapa \u00c7eneni"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1284
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Cleaver"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1285
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u83dc\u5200"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1286
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Cleaver"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1287
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u83dc\u5200"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1288
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Cleaver"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1289
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Cleaver"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1290
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pisau"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1291
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Couteau"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1292
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "K\u00fcchenbeil"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1293
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Mannaia"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1294
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Esperto"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1295
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Cuchillo"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1296
    sget v1, Lcom/p1/mobile/android/R$string;->h5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Mutfak B\u0131\u00e7a\u011f\u0131"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1297
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "tongue"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1298
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5410\u820c"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1299
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u3042\u3063\u304b\u3093\u3079\u30fc"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1300
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5410\u820c"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1301
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\uba54\ub871"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u0e41\u0e25\u0e1a\u0e25\u0e34\u0e49\u0e19"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1303
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "lidah"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1304
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "langue"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1305
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Gesicht mit herausgestreckter Zunge"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1306
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "lingua"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1307
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "l\u00edngua"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1308
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "lengua"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1309
    sget v1, Lcom/p1/mobile/android/R$string;->R6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Dil \u00c7\u0131karma"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1310
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rain"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1311
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u4e0b\u96e8"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1312
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rain"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1313
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u4e0b\u96e8"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1314
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rain"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1315
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Rain"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1316
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Hujan"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1317
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pluie"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1318
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Regen"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1319
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Pioggia"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1320
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Chuva"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1321
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Lluvia"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1322
    sget v1, Lcom/p1/mobile/android/R$string;->l6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Ya\u011fmur"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1323
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "yock"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1324
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u61a8\u7b11"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1325
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "yock"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1326
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u61a8\u7b11"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1327
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "yock"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1328
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "yock"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1329
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "jijik"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1330
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "beurk"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1331
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "L\u00e4chelndes Gesicht"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1332
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "risatina"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1333
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "gracejo"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1334
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Risotada"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1335
    sget v1, Lcom/p1/mobile/android/R$string;->e7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "G\u00fcle\u00e7"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1336
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Grimace"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1337
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v22, v2

    const-string v2, "\u618b\u5634"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1338
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1339
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u618b\u5634"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1340
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1341
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1342
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Meringis"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1343
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1344
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Zerknirscht"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1345
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Smorfia"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1346
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Careta"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1347
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mueca"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1348
    sget v1, Lcom/p1/mobile/android/R$string;->G5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "A\u011fz\u0131n\u0131 Tutma"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1349
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Sleep"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1350
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u7761"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1351
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1352
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u7761"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1354
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1355
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Tidur"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1356
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Dormir"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1357
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Schlafend"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1358
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Sonno"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1359
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Sono"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1360
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Dormir"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1361
    sget v1, Lcom/p1/mobile/android/R$string;->B6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Uykulu"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1362
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "angel"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1363
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5929\u4f7f"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1364
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5929\u4f7f"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1365
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u5929\u4f7f"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1366
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\ucc9c\uc0ac"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1367
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u0e19\u0e32\u0e07\u0e1f\u0e49\u0e32"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1368
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "malaikat"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1369
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "ange"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1370
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Engel"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1371
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "angelo"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1372
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "anjo"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1373
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "\u00e1ngel"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1374
    sget v1, Lcom/p1/mobile/android/R$string;->P4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Melek"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1375
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v11, "Toasted"

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1376
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v23, v3

    const-string v3, "\u8870"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1377
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1378
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u8870"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1379
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1380
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1381
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bersulang"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1382
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Grill\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1383
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Total erledigt"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1384
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Abbrustolito"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1385
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Queimado"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1386
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Tostado"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1387
    sget v1, Lcom/p1/mobile/android/R$string;->Q6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "D\u00fc\u015f\u00fc\u015f"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1388
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "OK"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1389
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v24, v4

    const-string v4, "\u597d\u7684"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1390
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1391
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u597d\u7684"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1392
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1393
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1394
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "OKE"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1395
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1396
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "OK Handgeste"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1397
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1398
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1399
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "De acuerdo"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1400
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tamam"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1401
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wronged"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1402
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u59d4\u5c48"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1403
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wronged"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1404
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u59d4\u5c48"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1405
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wronged"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1406
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wronged"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1407
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tanda Silang Salah"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1408
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Injuste"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1409
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sich ungerecht behandelt f\u00fchlend"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1410
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Offeso"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1411
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Enganado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1412
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Equivocado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1413
    sget v1, Lcom/p1/mobile/android/R$string;->b7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Ma\u011fdur"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1414
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "disappointed"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1415
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5931\u671b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1416
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7126\u308a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1417
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5931\u671b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1418
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc2ac\ud514"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1419
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e1c\u0e34\u0e14\u0e2b\u0e27\u0e31\u0e07"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1420
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "kecewa"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1421
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "d\u00e9ception"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1422
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "entt\u00e4uscht"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1423
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "deluso"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1424
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "desapontado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1425
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "decepcionado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1426
    sget v1, Lcom/p1/mobile/android/R$string;->u5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "K\u0131rg\u0131n"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1427
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Beer"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1428
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v25, v3

    const-string v3, "\u5564\u9152"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1429
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1430
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5564\u9152"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1431
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1432
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1433
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bir"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1434
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bi\u00e8re"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1435
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bier"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1436
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Birra"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1437
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cerveja"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1438
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cerveza"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1439
    sget v1, Lcom/p1/mobile/android/R$string;->W4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bira"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1440
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "thumbsup"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1441
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f3a"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1442
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u3044\u3044\u306d"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1443
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f37"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1444
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\uc5c4\uc9c0\ucc99"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1445
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u0e40\u0e01\u0e48\u0e07"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1446
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "jempol"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1447
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pouce en l\'air"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1448
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Daumen nach oben"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1449
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pollice in su"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1450
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "polegar para cima"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1451
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pulgararriba"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1452
    sget v1, Lcom/p1/mobile/android/R$string;->P6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "G\u00fc\u00e7l\u00fc"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1453
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stupefied"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1454
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u53d1\u5446"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1455
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stupefied"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1456
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u767c\u5446"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1457
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stupefied"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1458
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stupefied"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1459
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Tertegun"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1460
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stup\u00e9fait"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1461
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Finster blickend"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1462
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Stupito"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1463
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Perplexo"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1464
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Aturdido"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1465
    sget v1, Lcom/p1/mobile/android/R$string;->J6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u015ea\u015fk\u0131nl\u0131k"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1466
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bah!R"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1467
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v26, v4

    const-string v4, "\u53f3\u54fc\u54fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1468
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1469
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53f3\u54fc\u54fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1470
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1471
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1472
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bah!Kn"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1473
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1474
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Ablehnend mit nach rechts gewandtem Gesicht"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1475
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Disprezzo D"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1476
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1477
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1478
    sget v1, Lcom/p1/mobile/android/R$string;->U4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Sa\u011fa K\u00fcsme"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1479
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Angry"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1480
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u53d1\u6012"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1481
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Angry_Y"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1482
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u767c\u6012"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1483
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Angry_Y"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1484
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Angry"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1485
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Marah"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1486
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "F\u00e2ch\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1487
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "W\u00fctend"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1488
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Arrabbiato"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1489
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Zangado"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1490
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Enfadado"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1491
    sget v1, Lcom/p1/mobile/android/R$string;->R4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u00d6fkeli"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1492
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "love"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1493
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u6bd4\u5fc3"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1494
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "love"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1495
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u6bd4\u5fc3"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1496
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "love"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1497
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "love"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1498
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "cinta"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1499
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "amour"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1500
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Liebe"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1501
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "amore"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1502
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "amor"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1503
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Amor"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1504
    sget v1, Lcom/p1/mobile/android/R$string;->W5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Y\u00fcrekten"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1505
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gocrazy"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1506
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u75af\u4e86"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1507
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gocrazy"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1508
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u760b\u4e86"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1509
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gocrazy"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1510
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gocrazy"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1511
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Menjadi Gila"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1512
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Devenir fou"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1513
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Ich werde verr\u00fcckt"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1514
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Impazzito"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1515
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Louco"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1516
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Enloquecido"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1517
    sget v1, Lcom/p1/mobile/android/R$string;->E5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u00c7\u0131lg\u0131n"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1518
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cake"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1519
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u86cb\u7cd5"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1520
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cake"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1521
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u86cb\u7cd5"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1522
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cake"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1523
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Cake"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1524
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Kue"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1525
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "G\u00e2teau"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1526
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Kuchen"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1527
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Torta"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1528
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Bolo"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1529
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pastel"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1530
    sget v1, Lcom/p1/mobile/android/R$string;->d5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pasta"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1531
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Sweat"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1532
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6d41\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1533
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1534
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6d41\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1535
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1536
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1537
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Berkeringat"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1538
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Transpiration"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1539
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Schwitzen"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1540
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sudore"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1541
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Transpira\u00e7\u00e3o"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1542
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sudor"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1543
    sget v1, Lcom/p1/mobile/android/R$string;->M6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Terleme"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1544
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Blush"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1545
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u56e7"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1546
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Blush_Y"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1547
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u56e7"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1548
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Blush_Y"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1549
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Blush"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1550
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Memerah"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1551
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Rougissement"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1552
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Vor Schock aufgerissener Mund"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1553
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Arrossito"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1554
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Corar"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1555
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sonrojado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1556
    sget v1, Lcom/p1/mobile/android/R$string;->a5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Aman!"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1557
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Yeah"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1558
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v27, v3

    const-string v3, "\u8036"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1559
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1560
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u8036"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1561
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1562
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1563
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1564
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Ouais"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1565
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Klar!"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1566
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1567
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1568
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1569
    sget v1, Lcom/p1/mobile/android/R$string;->d7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Yay"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1570
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "thumbsdown"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1571
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f31"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1572
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u30d6\u30fc\u30a4\u30f3\u30b0"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1573
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f31"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1574
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\uc57c\uc720"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1575
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u0e2d\u0e48\u0e2d\u0e19"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1576
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "jempol ke bawah"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1577
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pouces vers le bas"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1578
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Daumen nach unten"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1579
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pollice in basso"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1580
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "polegar para baixo"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1581
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "pulgarabajo"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1582
    sget v1, Lcom/p1/mobile/android/R$string;->O6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Zay\u0131f"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1583
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "doh"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1584
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u6293\u72c2"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1585
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u3066\u3078\u3063"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1586
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u6293\u72c2"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1587
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\uae84\ub975"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1588
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u0e1a\u0e49\u0e32"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1589
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "gila"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1590
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "frustration"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1591
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sich an den Kopf fassend"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1592
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sorpresa"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1593
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "dah"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1594
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "ups"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1595
    sget v1, Lcom/p1/mobile/android/R$string;->v5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u00c7\u0131lg\u0131n"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1596
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Trick"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1597
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u574f\u7b11"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1598
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Trick"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1599
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u58de\u7b11"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1600
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Trick"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1601
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Trick"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1602
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Sulap"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1603
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Tour"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1604
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "H\u00e4misch l\u00e4chelnd"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1605
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Trucco"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1606
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Truque"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1607
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Truco"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1608
    sget v1, Lcom/p1/mobile/android/R$string;->S6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "S\u0131r\u0131tma"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1609
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "grin"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1610
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u53ef\u7231"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1611
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u306b\u3063\u3053\u308a"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1612
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u53ef\u611b"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1613
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\ubbf8\uc18c"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1614
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u0e19\u0e48\u0e32\u0e23\u0e31\u0e01"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1615
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "nyengir"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1616
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "grand sourire"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1617
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "grinsend"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1618
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sorrisino"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1619
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sorriso rasgado"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1620
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sonrisa"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1621
    sget v1, Lcom/p1/mobile/android/R$string;->H5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Tatl\u0131"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1622
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Fist"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1623
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u62f3\u5934"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1624
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Fist"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1625
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u62f3\u982d"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1626
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Fist"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1627
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Fist"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1628
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Tinju"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1629
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Poing"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1630
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Geschlossene Faust"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1631
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pugno"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1632
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Punho"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1633
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pu\u00f1o"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1634
    sget v1, Lcom/p1/mobile/android/R$string;->B5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Yumruk"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1635
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Coffee"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1636
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5496\u5561"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1637
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Coffee"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1638
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5496\u5561"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1639
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Coffee"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1640
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Coffee"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1641
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Kopi"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1642
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Caf\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1643
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Caf\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1644
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Caff\u00e8"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1645
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Caf\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1646
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Caf\u00e9"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1647
    sget v1, Lcom/p1/mobile/android/R$string;->i5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Kahve"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1648
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "hot"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1649
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f97\u610f"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1650
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u30ad\u30e9\u30fc\u30f3"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1651
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u5f97\u610f"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1652
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\uc36c\uadf8\ub9ac"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1653
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u0e20\u0e39\u0e21\u0e34\u0e43\u0e08"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1654
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "puas"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1655
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "chaud"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1656
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "hei\u00dfes Gesicht"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1657
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "caldo"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1658
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "quente"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1659
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "sexy"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1660
    sget v1, Lcom/p1/mobile/android/R$string;->N5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gururlu"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1661
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Thumbsup"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1662
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u68d2"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1663
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Thumbsup"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1664
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "\u68d2"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1665
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Thumbsup"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1666
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Thumbsup"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1667
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Jempol"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1668
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pouce en l\'air"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1669
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Toll"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1670
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pollice in su"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1671
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Polegar para cima"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1672
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Pulgararriba"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1673
    sget v1, Lcom/p1/mobile/android/R$string;->N6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "S\u00fcper"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1674
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Like"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1675
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8d5e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1676
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1677
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8d0a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1678
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1679
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1680
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Suka"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1681
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "J\'aime"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1682
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1683
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Mi piace"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1684
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Gosto"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1685
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Me gusta"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1686
    sget v1, Lcom/p1/mobile/android/R$string;->T5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Be\u011fen"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1687
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v3, "Skull"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1688
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u9ab7\u9ac5"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1689
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1690
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u9ab7\u9acf"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1691
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1692
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1693
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tengkorak"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1694
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Cr\u00e2ne"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1695
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Totenkopf"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1696
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Teschio"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1697
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Caveira"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1698
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Calavera"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1699
    sget v1, Lcom/p1/mobile/android/R$string;->z6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Kafatas\u0131"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1700
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Scare"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1701
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5413"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1702
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Scare"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1703
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5687"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1704
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Scare"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1705
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Scare"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1706
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Takut"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1707
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Effrayer"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1708
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Erschrocken"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1709
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Spaventato"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1710
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Assustado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1711
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Asustado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1712
    sget v1, Lcom/p1/mobile/android/R$string;->s6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Korkma"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1713
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Good"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1714
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u68d2\u68d2\u7684"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1715
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Good"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1716
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u68d2\u68d2\u7684"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1717
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Good"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1718
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Good"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1719
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bagus"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1720
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bien"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1721
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Super"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1722
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bene"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1723
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bom"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1724
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bueno"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1725
    sget v1, Lcom/p1/mobile/android/R$string;->F5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Harika"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1726
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Brokenheart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1727
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5fc3\u788e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1728
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Brokenheart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1729
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5fc3\u788e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1730
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Brokenheart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1731
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Brokenheart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1732
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Patah hati"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1733
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "C\u0153ur bris\u00e9"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1734
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Gebrochenes Herz"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1735
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Cuore spezzato"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1736
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Cora\u00e7\u00e3o partido"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1737
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Coraz\u00f3nRoto"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1738
    sget v1, Lcom/p1/mobile/android/R$string;->b5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Keder"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1739
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Rock"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1740
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v28, v5

    const-string v5, "\u6447\u6eda"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1741
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1742
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u6416\u6efe"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1743
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1744
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1745
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Bergaya Metal"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1746
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1747
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Geh\u00f6rnte Hand (Rock and Roll)"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1748
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Corna"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1749
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Chifres"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1750
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Piedra"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1751
    sget v1, Lcom/p1/mobile/android/R$string;->n6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Metal"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1752
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Complacent"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1753
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u563f\u563f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1754
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Complacent"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1755
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u563f\u563f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1756
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Complacent"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1757
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Complacent"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1758
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Puas"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1759
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Complaisant"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1760
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Selbstzufrieden"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1761
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Soddisfatto"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1762
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Contente"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1763
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Satisfecho"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1764
    sget v1, Lcom/p1/mobile/android/R$string;->k5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Hey Hey"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1765
    sget v1, Lcom/p1/mobile/android/R$string;->Z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "blush"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1766
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8138\u7ea2"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1767
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u3084\u3063\u305f\u3041"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1768
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u81c9\u7d05"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1769
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubd80\ub044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1770
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e2d\u0e32\u0e22"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1771
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "tersipu"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1772
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "rougissement"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1773
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "err\u00f6tet"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1774
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "arrossire"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1775
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "corar"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1776
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "sonrojado"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1777
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Utanma"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1778
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "ET"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1779
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5916\u661f\u4eba"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1780
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1781
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5916\u661f\u4eba"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1782
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1783
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1784
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1785
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Extra-terrestre"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1786
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Au\u00dferirdischer"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1787
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1788
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1789
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1790
    sget v1, Lcom/p1/mobile/android/R$string;->y5:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Uzayl\u0131"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1791
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u767c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1792
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53d1"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1793
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Rich"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1794
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30ea\u30c3\u30c1"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1795
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud48d\ubd80\ud55c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1796
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Kaya"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1797
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5403\u74dc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1798
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5403\u74dc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1799
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Onlooker"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1800
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u898b\u7269\u4eba"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1801
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubc29\uad00\uc790"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1802
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Penonton"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1803
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6851\u5fc3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1804
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Mengerut"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1805
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ucc0c\ud478\ub9b0 \uc5bc\uad74"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1806
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Concerned"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1807
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6851\u5fc3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1808
    sget v1, Lcom/p1/mobile/android/R$string;->X7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u3057\u304b\u3081\u3063\u9762"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1809
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wow"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1810
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30ef\u30aa"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1811
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wow"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1812
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc640"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1813
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u54c7\u585e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1814
    sget v1, Lcom/p1/mobile/android/R$string;->t8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u54c7\u585e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1815
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u81ea\u5f97"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1816
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u81ea\u5f97"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1817
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u304b\u3063\u3053\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1818
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Cool"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1819
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uba4b\uc9c4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1820
    sget v1, Lcom/p1/mobile/android/R$string;->C7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Keren"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1821
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v12, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1822
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5bb3\u7f9e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1823
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5bb3\u7f9e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1824
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc218\uc90d\uc740"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1825
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30b7\u30e3\u30a4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1826
    sget v1, Lcom/p1/mobile/android/R$string;->c8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Malu"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1827
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30b5\u30a4\u30ec\u30f3\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1828
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc26c\uc787"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1829
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Silent"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1830
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u4f4f\u53e3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1831
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u4f4f\u53e3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1832
    sget v1, Lcom/p1/mobile/android/R$string;->b8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Diam"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1833
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7761"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1834
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7761\u7720"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1835
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7761"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1836
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tidur"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1837
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc790\ub2e4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1838
    sget v1, Lcom/p1/mobile/android/R$string;->h8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1839
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6dd8\u6c23"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1840
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tongue"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1841
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubabb\ub41c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1842
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3044\u305f\u305a\u3089"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1843
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6dd8\u6c14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1844
    sget v1, Lcom/p1/mobile/android/R$string;->S7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "nakal"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1845
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5472\u7259"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1846
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5472\u7259"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1847
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Grin"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1848
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Nyengir"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1849
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d0\u30d6\u30eb"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1850
    sget v1, Lcom/p1/mobile/android/R$string;->n8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub5a0\ub4dc\ub294 \uc18c\ub9ac"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1851
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u60ca\u8be7"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1852
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Panic"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1853
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Panik"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1854
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9a5a\u8a6b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1855
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d1\u30cb\u30c3\u30af"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1856
    sget v1, Lcom/p1/mobile/android/R$string;->o7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uacf5\ud669"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1857
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u56e7"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1858
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u304a\u3063\u3068"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1859
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc8c4\uc1a1\ud569\ub2c8\ub2e4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1860
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Oops"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1861
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u56e7"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1862
    sget v1, Lcom/p1/mobile/android/R$string;->G7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Memerah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1863
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u597d\u6c14\u54df"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1864
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u597d\u6c23\u55b2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1865
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mad"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1866
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30de\u30c3\u30c9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1867
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubbf8\uce5c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1868
    sget v1, Lcom/p1/mobile/android/R$string;->p7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Gila"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1869
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5614\u5410"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1870
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uad6c\ud1a0"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1871
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5455\u5410"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1872
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Puke"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1873
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Muntah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1874
    sget v1, Lcom/p1/mobile/android/R$string;->o8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2d\u0e49\u0e27\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1875
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1876
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Kekek"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1877
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5077\u7b11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1878
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u542b\u307f\u7b11\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1879
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud0ac\ud0ac \uc6c3\uc74c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1880
    sget v1, Lcom/p1/mobile/android/R$string;->m8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e0b\u0e34\u0e01\u0e0b\u0e35\u0e49"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1881
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud558\uc580 \ub208"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1882
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mendesah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1883
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u767d\u3044\u76ee"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1884
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u767d\u773c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1885
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e40\u0e25\u0e47\u0e01\u0e19\u0e49\u0e2d\u0e22"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1886
    sget v1, Lcom/p1/mobile/android/R$string;->F7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Slight"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1887
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1888
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1889
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Sombong"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1890
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac70\ub9cc\ud55c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1891
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1892
    sget v1, Lcom/p1/mobile/android/R$string;->r7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1893
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1894
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7720\u3044\u3067\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1895
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1896
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1897
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc878\ub9ac\ub294"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1898
    sget v1, Lcom/p1/mobile/android/R$string;->i8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mengantuk"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1899
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ucda9\uaca9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1900
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u60ca\u5413"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1901
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9a5a\u5687"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1902
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Shock"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1903
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Syok"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1904
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30b7\u30e7\u30c3\u30af"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1905
    sget v1, Lcom/p1/mobile/android/R$string;->a8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e0a\u0e47\u0e2d\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1906
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Yock"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1907
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u611a\u304b\u306a\u7b11\u9854"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1908
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u61a8\u7b11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1909
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc5b4\ub9ac\uc11d\uc740 \ubbf8\uc18c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1910
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u61a8\u7b11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1911
    sget v1, Lcom/p1/mobile/android/R$string;->f8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Jijik"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1912
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u60a0\u95f2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1913
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1914
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30b3\u30de\u30f3\u30c9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1915
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud2b9\uacf5\ub300"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1916
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Komando"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1917
    sget v1, Lcom/p1/mobile/android/R$string;->P7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e04\u0e2d\u0e21\u0e21\u0e32\u0e19\u0e42\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1918
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5492\u9a82"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1919
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5492\u99e1"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1920
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v15, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1921
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Memarahi"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1922
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u546a\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1923
    sget v1, Lcom/p1/mobile/android/R$string;->E7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc800\uc8fc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1924
    sget v1, Lcom/p1/mobile/android/R$string;->Z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1925
    sget v1, Lcom/p1/mobile/android/R$string;->Z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5618"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1926
    sget v1, Lcom/p1/mobile/android/R$string;->Z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc870\uc6a9\ud558\uac8c \ud558\ub2e4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1927
    sget v1, Lcom/p1/mobile/android/R$string;->Z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9759\u3051\u3055"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1928
    sget v1, Lcom/p1/mobile/android/R$string;->Z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e1f\u0e48\u0e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1929
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Confused"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1930
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bingung"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1931
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8ff7\u7cca"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1932
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8ff7\u7cca"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1933
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6df7\u4e71\u3057\u3066\u3044\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1934
    sget v1, Lcom/p1/mobile/android/R$string;->x7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud63c\ub780 \uc2a4\ub7ec\uc6c0"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1935
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8870"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1936
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc1e0\ud1f4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1937
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bersulang"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1938
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1939
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4f4e\u4e0b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1940
    sget v1, Lcom/p1/mobile/android/R$string;->p8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8870"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1941
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9ab7\u9acf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1942
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4eba\u9aa8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1943
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1944
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud574\uace8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1945
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9ab7\u9ac5"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1946
    sget v1, Lcom/p1/mobile/android/R$string;->z7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tengkorak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1947
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30cf\u30f3\u30de\u30fc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1948
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6572\u6253"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1949
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub9dd\uce58"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1950
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v2, v28

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1951
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Palu"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1952
    sget v1, Lcom/p1/mobile/android/R$string;->u7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6572\u6253"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1953
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u64e6\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1954
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v27

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1955
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7121\u8a00"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1956
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u64e6\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1957
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Terdiam"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1958
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ub9d0 \ubabb\ud558\ub294"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1959
    sget v1, Lcom/p1/mobile/android/R$string;->r8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e40\u0e07\u0e35\u0e22\u0e1a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1960
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v24

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1961
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6473\u9f3b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1962
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ucf54\ub97c \uace8\ub77c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1963
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u9f3b\u3092\u3064\u307e\u3080"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1964
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u62a0\u9f3b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1965
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Mengupil"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1966
    sget v1, Lcom/p1/mobile/android/R$string;->T7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e14\u0e36\u0e07\u0e08\u0e21\u0e39\u0e01"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1967
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v23

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1968
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u62cd\u624b"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1969
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v5, v22

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1970
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1971
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubc15\uc218"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1972
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tepuk"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1973
    sget v1, Lcom/p1/mobile/android/R$string;->q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e15\u0e1a\u0e21\u0e37\u0e2d"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1974
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53f3\u54fc\u54fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1975
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bah!"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1976
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53f3\u54fc\u54fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1977
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30cf\u30f3\u30d5!"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1978
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud5c9!"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1979
    sget v1, Lcom/p1/mobile/android/R$string;->W7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bah!"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1980
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Shrunken"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1981
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u59d4\u5c48"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1982
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud2c0\ub838\ub2e4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1983
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Salah"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1984
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u82e6\u3057\u3081\u3089\u308c\u305f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1985
    sget v1, Lcom/p1/mobile/android/R$string;->M7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e2b\u0e14"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1986
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Kiss"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1987
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Ciuman"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1988
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud0a4\uc2a4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1989
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u4eb2\u4e00\u4e2a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1990
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u89aa\u4e00\u500b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1991
    sget v1, Lcom/p1/mobile/android/R$string;->O7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u63a5\u543b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1992
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u54c0\u308c\u306a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1993
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53ef\u601c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1994
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc11c\ud22c\ub978"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1995
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Whimper"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1996
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u53ef\u6190"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1997
    sget v1, Lcom/p1/mobile/android/R$string;->Y6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Merengek"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1998
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5fae\u5fae\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1999
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30b9\u30de\u30a4\u30eb"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2000
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubbf8\uc18c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2001
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tersenyum"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2002
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5fae\u5fae\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2003
    sget v1, Lcom/p1/mobile/android/R$string;->D6:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Smile"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2004
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u75c5\u6c17"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2005
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u751f\u75c5"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2006
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sick"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2007
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubcd1\ub4e0"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2008
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Lara"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2009
    sget v1, Lcom/p1/mobile/android/R$string;->d8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e1b\u0e48\u0e27\u0e22"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2010
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u3084\u3063\u305f\u3041"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2011
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u81c9\u7d05"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2012
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8138\u7ea2"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2013
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Blush"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2014
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Tersipu"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2015
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubd80\ub044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2016
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "tersipu"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2017
    sget v1, Lcom/p1/mobile/android/R$string;->n7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e2b\u0e19\u0e49\u0e32\u0e41\u0e14\u0e07"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2018
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7834\u6d95\u70ba\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2019
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Lol"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2020
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u3042\u306f\u306f"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2021
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u314b\u314b\u314b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2022
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7834\u6d95\u4e3a\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2023
    sget v1, Lcom/p1/mobile/android/R$string;->k8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Wkwk"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2024
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubb34\uc11c\uc6c0"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2025
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6050\u60e7"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2026
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6050\u308c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2027
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Terror"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2028
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Takut"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2029
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6050\u61fc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2030
    sget v1, Lcom/p1/mobile/android/R$string;->I7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e04\u0e27\u0e32\u0e21\u0e2b\u0e27\u0e32\u0e14\u0e01\u0e25\u0e31\u0e27"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2031
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7121\u8a9e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2032
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u65e0\u8bed"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2033
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e14\u0e38\u0e08"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2034
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc5b4\uc774\uc5c6\uc74c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2035
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v20

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2036
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bungkam"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2037
    sget v1, Lcom/p1/mobile/android/R$string;->e8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u306f\u3041"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2038
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc57c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2039
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u563f\u54c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2040
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Hey"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2041
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u306d\u3048"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2042
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Hei"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2043
    sget v1, Lcom/p1/mobile/android/R$string;->N7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e40\u0e2e\u0e49"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2044
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ucee4\ubc84 \uc5bc\uad74"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2045
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6342\u8138"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2046
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Telapak tangan"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2047
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6342\u81c9"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2048
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Facepalm"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2049
    sget v1, Lcom/p1/mobile/android/R$string;->H7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30ab\u30d0\u30fc\u9762"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2050
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Senyum jahat"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2051
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5978\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2052
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Smirk"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2053
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u4e0d\u5409\u306a\u7b11\u9854"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2054
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc0ac\uc545\ud55c \ubbf8\uc18c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2055
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5978\u7b11"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2056
    sget v1, Lcom/p1/mobile/android/R$string;->g8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e22\u0e49\u0e34\u0e21\u0e40\u0e22\u0e49\u0e22"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2057
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Smart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2058
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u673a\u667a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2059
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30b9\u30de\u30fc\u30c8"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2060
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Pintar"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2061
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6a5f\u667a"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2062
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ub611\ub611\ud55c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2063
    sget v1, Lcom/p1/mobile/android/R$string;->s8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e09\u0e25\u0e32\u0e14"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2064
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u898b\u7269\u4eba"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2065
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Onlooker"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2066
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ubc29\uad00\uc790"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2067
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5403\u74dc"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2068
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Penonton"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2069
    sget v1, Lcom/p1/mobile/android/R$string;->q8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e1c\u0e39\u0e49\u0e0a\u0e21"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2070
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bertekat bulat"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2071
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u594b\u6597"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2072
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "GoForIt"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2073
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u596e\u9b25"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2074
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u95d8\u4e89"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2075
    sget v1, Lcom/p1/mobile/android/R$string;->J7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ub178\ub825"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2076
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2077
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6d41\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2078
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u6d41\u6c57"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2079
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Sweats"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2080
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Berkeringat"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2081
    sget v1, Lcom/p1/mobile/android/R$string;->j8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ub540"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2082
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v21

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2083
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5507"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2084
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc785\uc220"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2085
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5634\u5507"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2086
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Bibir"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2087
    sget v1, Lcom/p1/mobile/android/R$string;->Q7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e42\u0e2d\u0e29\u0e10\u0e4c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2088
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u611b\u5fc3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2089
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u611b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2090
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Hati"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2091
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u7231\u5fc3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2092
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc0ac\ub791"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2093
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Heart"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2094
    sget v1, Lcom/p1/mobile/android/R$string;->R7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e2b\u0e31\u0e27\u0e43\u0e08"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2095
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u3044\u3044\u305e"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2096
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uc5c4\uc9c0 \uc190\uac00\ub77d"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2097
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "ThumbsUp"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2098
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Jempolan"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2099
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u725b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2100
    sget v1, Lcom/p1/mobile/android/R$string;->A7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u725b"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2101
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5dee\u52b2"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2102
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u5dee\u52c1"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2103
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u8ca7\u3057\u3044"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2104
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "ThumbsDown"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2105
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Miskin"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2106
    sget v1, Lcom/p1/mobile/android/R$string;->s7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uac00\ub09c\ud55c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2107
    sget v1, Lcom/p1/mobile/android/R$string;->t7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Salut"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2108
    sget v1, Lcom/p1/mobile/android/R$string;->t7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u62b1\u62f3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2109
    sget v1, Lcom/p1/mobile/android/R$string;->t7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v18

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2110
    sget v1, Lcom/p1/mobile/android/R$string;->t7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\ud3ec\uad8c"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2111
    sget v1, Lcom/p1/mobile/android/R$string;->t7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e17\u0e31\u0e01\u0e17\u0e32\u0e22"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2112
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v19

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2113
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u52fe\u5f15"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2114
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "Mengisyaratkan"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2115
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u30d9\u30c3\u30b3\u30f3"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2116
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\uaf80\uc5b4 \ubd80\ub974\ub2e4"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2117
    sget v1, Lcom/p1/mobile/android/R$string;->Y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u0e01\u0e27\u0e31\u0e01\u0e21\u0e37\u0e2d"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2118
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u54e6\u4e86"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2119
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v4, "\u54e6\u4e86"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2120
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v4, v25

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2121
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud655\uc778"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2122
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2123
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Baik"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2124
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5408\u5341"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2125
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5d07\u62dd"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2126
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uc608\ubc30"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2127
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Worship"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2128
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Menyembah"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2129
    sget v1, Lcom/p1/mobile/android/R$string;->l8:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e19\u0e21\u0e31\u0e2a\u0e01\u0e32\u0e23"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2130
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Bir"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2131
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u30d3\u30fc\u30eb"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2132
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5564\u9152"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2133
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ub9e5\uc8fc"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2134
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v5, v26

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2135
    sget v1, Lcom/p1/mobile/android/R$string;->v7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e40\u0e1a\u0e35\u0e22\u0e23\u0e4c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2136
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u70b8\u5f39"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2137
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u7206\u5f3e"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2138
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u70b8\u5f48"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2139
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Bom"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2140
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Bomb"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2141
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud3ed\ud0c4"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2142
    sget v1, Lcom/p1/mobile/android/R$string;->y7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e27\u0e32\u0e07\u0e23\u0e30\u0e40\u0e1a\u0e34\u0e14"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2143
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u6176\u795d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2144
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Party"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2145
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u30d1\u30fc\u30c6\u30a3\u30fc"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2146
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Pesta"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2147
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5e86\u795d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2148
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud30c\ud2f0"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2149
    sget v1, Lcom/p1/mobile/android/R$string;->B7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e1e\u0e23\u0e23\u0e04"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2150
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u8d08\u308a\u7269"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2151
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Hadiah"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2152
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u79ae\u7269"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2153
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Gift"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2154
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uc120\ubb3c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2155
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u793c\u7269"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2156
    sget v1, Lcom/p1/mobile/android/R$string;->L7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e02\u0e2d\u0e07\u0e02\u0e27\u0e31\u0e0d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2157
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ube68\uac04 \ubd09\ud22c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2158
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u7d05\u5305"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2159
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Packet"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2160
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Amplop merah"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2161
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u7ea2\u5305"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2162
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u8d64\u3044\u5c01\u7b52"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2163
    sget v1, Lcom/p1/mobile/android/R$string;->V7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e2b\u0e48\u0e2d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2164
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u767c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2165
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u53d1"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2166
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Rich"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2167
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Kaya"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2168
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u30ea\u30c3\u30c1"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2169
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud48d\ubd80\ud55c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2170
    sget v1, Lcom/p1/mobile/android/R$string;->K7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e23\u0e27\u0e22"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2171
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ucd95\ubcf5"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2172
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u798f"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2173
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Blessing"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2174
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Berkat"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2175
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u795d\u798f"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2176
    sget v1, Lcom/p1/mobile/android/R$string;->w7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e1e\u0e23"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2177
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u732a\u5934"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2178
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v5, v17

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2179
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u8c6c\u982d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2180
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ub3fc\uc9c0"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2181
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u8c5a"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2182
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Babi"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2183
    sget v1, Lcom/p1/mobile/android/R$string;->U7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e2b\u0e21\u0e39"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2184
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5446\u4f4f"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2185
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Datar"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2186
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5516\u7136"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2187
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uba4d\ub54c\ub9ac\uae30"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2188
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Neutral"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2189
    sget v1, Lcom/p1/mobile/android/R$string;->k4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e15\u0e30\u0e25\u0e36\u0e07"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2190
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u7565\u7565\u7565"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2191
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Smirking"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2192
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Mengejek"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2193
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u3066\u3078\u307a\u308d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2194
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uba54\ub871"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2195
    sget v1, Lcom/p1/mobile/android/R$string;->C3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e22\u0e34\u0e49\u0e21\u0e41\u0e09\u0e48\u0e07"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2196
    sget v1, Lcom/p1/mobile/android/R$string;->H3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5410\u8840"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2197
    sget v1, Lcom/p1/mobile/android/R$string;->H3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Vomiting blood"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2198
    sget v1, Lcom/p1/mobile/android/R$string;->H3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "kesal"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2199
    sget v1, Lcom/p1/mobile/android/R$string;->H3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud669\ub2f9"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2200
    sget v1, Lcom/p1/mobile/android/R$string;->H3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e2d\u0e32\u0e40\u0e08\u0e35\u0e22\u0e19"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2201
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u65e0\u5948"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2202
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u7121\u5948"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2203
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Hurt"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2204
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Tersakiti"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2205
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u4ed5\u69d8\u304c\u7121\u3044"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2206
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ubc1c\uadf8\ub808"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2207
    sget v1, Lcom/p1/mobile/android/R$string;->S3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e44\u0e21\u0e48\u0e21\u0e35\u0e17\u0e32\u0e07\u0e40\u0e25\u0e37\u0e2d\u0e01"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2208
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u53f9\u6c14"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2209
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5606\u6c23"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2210
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Sigh"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2211
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Menghela Nafas"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2212
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u305f\u3081\u606f"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2213
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ud55c\uc228"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2214
    sget v1, Lcom/p1/mobile/android/R$string;->M3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e40\u0e2e\u0e49\u0e2d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2215
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u77f3\u5316"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2216
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Expressionless"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2217
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Tanpa Ekspresi"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2218
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uad73\uc74c"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2219
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u77f3\u5316\u4e2d"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2220
    sget v1, Lcom/p1/mobile/android/R$string;->D3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e44\u0e21\u0e48\u0e41\u0e2a\u0e14\u0e07\u0e2d\u0e2d\u0e01"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2221
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5f3a\u6491"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2222
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5f37\u6490"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2223
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "GoForIt"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2224
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Semangat"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2225
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u30b5\u30dd\u30fc\u30c8"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2226
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\uc874\ubc84"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2227
    sget v1, Lcom/p1/mobile/android/R$string;->E3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e25\u0e07\u0e21\u0e37\u0e2d\u0e17\u0e33"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2228
    sget v1, Lcom/p1/mobile/android/R$string;->F3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Emm"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2229
    sget v1, Lcom/p1/mobile/android/R$string;->F3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e2d\u0e37\u0e21\u0e21"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2230
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5d07\u62dc"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2231
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Idolize"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2232
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "Kagum"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2233
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u5d07\u3081\u308b"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2234
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u0e40\u0e04\u0e32\u0e23\u0e1e"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2235
    sget v1, Lcom/p1/mobile/android/R$string;->G3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\ub9ac\uc2a4\ud399"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2236
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v5, "\u6328\u6253"

    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2237
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2238
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Terpukul"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2239
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d1\u30f3\u30c1\u3092\u55b0\u3089\u3046"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2240
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud37d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2241
    sget v1, Lcom/p1/mobile/android/R$string;->I3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e15\u0e35"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2242
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5352"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2243
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2244
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tengkorak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2245
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6b7b\u306c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2246
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ucc0c\ub9bf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2247
    sget v1, Lcom/p1/mobile/android/R$string;->J3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e01\u0e30\u0e42\u0e2b\u0e25\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2248
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u60ca\u8bb6"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2249
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9a5a\u8a1d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2250
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Astonished"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2251
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Terkejut"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2252
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d3\u30c3\u30af\u30ea"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2253
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub180\ub7a8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2254
    sget v1, Lcom/p1/mobile/android/R$string;->K3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e15\u0e01\u0e43\u0e08"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2255
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2256
    sget v1, Lcom/p1/mobile/android/R$string;->L3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30aa\u30fc\u30b1\u30fc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2257
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6295\u964d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2258
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Give-in face"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2259
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Menyerah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2260
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u624b\u3092\u4e0a\u3052\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2261
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e22\u0e2d\u0e21\u0e41\u0e1e\u0e49"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2262
    sget v1, Lcom/p1/mobile/android/R$string;->N3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud56d\ubcf5"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2263
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "666"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2264
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Awesome"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2265
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Keren"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2266
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3059\u3054\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2267
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub300\ubc15"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2268
    sget v1, Lcom/p1/mobile/android/R$string;->O3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2a\u0e38\u0e14\u0e22\u0e2d\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2269
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e0d\u5c51"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2270
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Disdain"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2271
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Kesal"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2272
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u76ee\u3082\u304f\u308c\u306a\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2273
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubb34\uc2dc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2274
    sget v1, Lcom/p1/mobile/android/R$string;->P3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e14\u0e39\u0e16\u0e39\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2275
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u665a\u5b89"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2276
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Nighty"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2277
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tidur"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2278
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u304a\u3084\u3059\u307f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2279
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uad7f\ub098\uc787"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2280
    sget v1, Lcom/p1/mobile/android/R$string;->Q3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e01\u0e39\u0e49\u0e14\u0e44\u0e19\u0e17\u0e4c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2281
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u88c2\u5f00"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2282
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u88c2\u958b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2283
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Hancur"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2284
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u88c2\u3051\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2285
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uba58\ubd95"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2286
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e41\u0e15\u0e01\u0e2a\u0e25\u0e32\u0e22"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2287
    sget v1, Lcom/p1/mobile/android/R$string;->R3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Broken"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2288
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u644a\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2289
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6524\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2290
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Handsup"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2291
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tidak tahu"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2292
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u624b\u3092\u958b\u3051\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2293
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc190\ubc88\uca4d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2294
    sget v1, Lcom/p1/mobile/android/R$string;->T3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e22\u0e01\u0e21\u0e37\u0e2d\u0e02\u0e36\u0e49\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2295
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6413\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2296
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "RubHands"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2297
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Menggosok tangan"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2298
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u63c9\u307f\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2299
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc190 \ube44\ube44\uae30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2300
    sget v1, Lcom/p1/mobile/android/R$string;->N4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e16\u0e39\u0e21\u0e37\u0e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2301
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5077\u770b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2302
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "LetMeSee"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2303
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Melihat"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2304
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8997\u304d\u898b\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2305
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc5b4\ub514 \ubcf4\uc790"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2306
    sget v1, Lcom/p1/mobile/android/R$string;->X3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e41\u0e2d\u0e1a\u0e21\u0e2d\u0e07"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2307
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u5934"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2308
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u982d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2309
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "TouchHead"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2310
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mengelus Kepala"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2311
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u982d\u3092\u64ab\u3067\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2312
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc4f0\ub2f4\uc4f0\ub2f4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2313
    sget v1, Lcom/p1/mobile/android/R$string;->W3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e08\u0e31\u0e1a\u0e2b\u0e31\u0e27"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2314
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u54d2\u54a9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2315
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5660\u54a9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2316
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "No"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2317
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tidak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2318
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3060\u3081"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2319
    sget v1, Lcom/p1/mobile/android/R$string;->Y3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2d\u0e48\u0e32\u0e2e\u0e32"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2320
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u82e6\u6da9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2321
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u82e6\u6f80"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2322
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bitter"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2323
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Sedih"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2324
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u82e6\u6e0b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2325
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub610\ub974\ub975"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2326
    sget v1, Lcom/p1/mobile/android/R$string;->Z3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e02\u0e21\u0e02\u0e37\u0e48\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2327
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5acc\u5f03"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2328
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5acc\u68c4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2329
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Duh"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2330
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tidak Suka"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2331
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5acc\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2332
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Duh"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2333
    sget v1, Lcom/p1/mobile/android/R$string;->a4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e44\u0e21\u0e48\u0e0a\u0e2d\u0e1a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2334
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u54ed\u7b11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2335
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u54ed\u7b11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2336
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "CryLaugh"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2337
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tertawa dan Menangis"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2338
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5b09\u3057\u6ce3\u304d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2339
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc6c3\ud504\ub2e4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2340
    sget v1, Lcom/p1/mobile/android/R$string;->b4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e23\u0e49\u0e2d\u0e07\u0e44\u0e2b\u0e49\u0e41\u0e25\u0e30\u0e2b\u0e31\u0e27\u0e40\u0e23\u0e32\u0e30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2341
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u771f\u68d2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2342
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Great"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2343
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bagus"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2344
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3059\u3054\u3044\uff01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2345
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uad7f!"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2346
    sget v1, Lcom/p1/mobile/android/R$string;->c4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e40\u0e22\u0e35\u0e48\u0e22\u0e21\u0e22\u0e2d\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2347
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8b93\u6211\u60f3\u60f3"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2348
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8ba9\u6211\u60f3\u60f3"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2349
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "LetMeThink"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2350
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Berpikir"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2351
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3061\u3087\u3063\u3068\u8003\u3048\u307e\u3059"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2352
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc0dd\uac01 \uc880 \ud574\ubcfc\uac8c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2353
    sget v1, Lcom/p1/mobile/android/R$string;->d4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e02\u0e2d\u0e04\u0e34\u0e14\u0e01\u0e48\u0e2d\u0e19\u0e19\u0e30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2354
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u793e\u4f1a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2355
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u793e\u6703"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2356
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Social"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2357
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Sosial"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2358
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc18c\uc15c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2359
    sget v1, Lcom/p1/mobile/android/R$string;->e4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2a\u0e31\u0e07\u0e04\u0e21"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2360
    sget v1, Lcom/p1/mobile/android/R$string;->f4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "doge"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2361
    sget v1, Lcom/p1/mobile/android/R$string;->f4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Doge"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2362
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u70df\u82b1"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2363
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7159\u706b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2364
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Fireworks"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2365
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Kembang Api"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2366
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u82b1\u706b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2367
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e1e\u0e25\u0e38"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2368
    sget v1, Lcom/p1/mobile/android/R$string;->h4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud3ed\uc8fd"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2369
    sget v1, Lcom/p1/mobile/android/R$string;->g4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7206\u7af9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2370
    sget v1, Lcom/p1/mobile/android/R$string;->g4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Firework"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2371
    sget v1, Lcom/p1/mobile/android/R$string;->g4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Petasan"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2372
    sget v1, Lcom/p1/mobile/android/R$string;->g4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud3ed\uc8fd"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2373
    sget v1, Lcom/p1/mobile/android/R$string;->g4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e1b\u0e23\u0e30\u0e17\u0e31\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2374
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2375
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Baik"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2376
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5f53\u3066"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2377
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e15\u0e23\u0e07\u0e01\u0e25\u0e32\u0e07"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2378
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Ok"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2379
    sget v1, Lcom/p1/mobile/android/R$string;->i4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "The red dragon tile"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2380
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u997f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2381
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9913"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2382
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Hungry"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2383
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Lapar"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2384
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u304a\u8179\u7a7a\u3044\u305f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2385
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubc30\uace0\ud30c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2386
    sget v1, Lcom/p1/mobile/android/R$string;->j4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2b\u0e34\u0e27"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2387
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u52a0\u6cb9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2388
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "GoGoGo"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2389
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Dukungan"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2390
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9811\u5f35\u3063\u3066"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2391
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud654\uc774\ud305"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2392
    sget v1, Lcom/p1/mobile/android/R$string;->l4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2a\u0e39\u0e49\u0e46"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2393
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u54fc\u54fc"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2394
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "HumHum"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2395
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Cih"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2396
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d5\u30f3\u30d5\u30f3"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2397
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud765\ud765"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2398
    sget v1, Lcom/p1/mobile/android/R$string;->m4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e40\u0e2b\u0e2d\u0e46"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2399
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u9c7c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2400
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u9b5a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2401
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "WasteTime"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2402
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bermalas-malasan"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2403
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30b5\u30dc\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2404
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac8c\uc73c\ub984 \ud53c\uc6b0\uae30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2405
    sget v1, Lcom/p1/mobile/android/R$string;->n4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e08\u0e31\u0e1a\u0e1b\u0e25\u0e32\u0e06\u0e48\u0e32\u0e40\u0e27\u0e25\u0e32"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2406
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6446\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2407
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u64fa\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2408
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Wave"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2409
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Melambai"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2410
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u624b\u3092\u632f\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2411
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc190\uc0ac\ub798"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2412
    sget v1, Lcom/p1/mobile/android/R$string;->o4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e04\u0e25\u0e37\u0e48\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2413
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5e72\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2414
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e7e\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2415
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Cheers"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2416
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bersulang"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2417
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e7e\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2418
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac74\ubc30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2419
    sget v1, Lcom/p1/mobile/android/R$string;->q4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e44\u0e0a\u0e42\u0e22"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2420
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5047\u54ed"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2421
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "FakeCry"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2422
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tangisan Palsu"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2423
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5618\u6ce3\u304d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2424
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac00\uc9dc \ub208\ubb3c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2425
    sget v1, Lcom/p1/mobile/android/R$string;->r4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e23\u0e49\u0e2d\u0e07\u0e44\u0e2b\u0e49\u0e17\u0e34\u0e1e\u0e22\u0e4c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2426
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6697\u4e2d\u89c2\u5bdf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2427
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6697\u4e2d\u89c0\u5bdf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2428
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Peek"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2429
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mengintip"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2430
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3053\u3063\u305d\u308a\u89b3\u5bdf\u3059\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2431
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud6d4\uccd0 \ubcf4\uae30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2432
    sget v1, Lcom/p1/mobile/android/R$string;->s4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e41\u0e2d\u0e1a\u0e14\u0e39"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2433
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5728\u5417"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2434
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5728\u55ce"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2435
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Hello\uff1f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2436
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Halo"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2437
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3044\u307e\u3059\u304b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2438
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubb50\ud574?"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2439
    sget v1, Lcom/p1/mobile/android/R$string;->t4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2d\u0e22\u0e48\u0e39\u0e44\u0e2b\u0e21"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2440
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5934\u5927"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2441
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u982d\u5927"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2442
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "BigHead"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2443
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Kepala Besar"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2444
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5927\u5909\u306b\u306a\u3063\u305f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2445
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub300\ub450"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2446
    sget v1, Lcom/p1/mobile/android/R$string;->u4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2b\u0e31\u0e27\u0e42\u0e15"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2447
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u9526\u9ca4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2448
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6478\u9326\u9bc9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2449
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Luck"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2450
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Keberuntungan"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2451
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9326\u9bc9\u3092\u89e6\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2452
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud589\uc6b4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2453
    sget v1, Lcom/p1/mobile/android/R$string;->v4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e42\u0e0a\u0e04\u0e14\u0e35"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2454
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u642c\u7816"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2455
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u642c\u78da"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2456
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Working"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2457
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bekerja"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2458
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8f9b\u3044\u4ed5\u4e8b\u3092\u3059\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2459
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc77c\ud558\ub294 \uc911"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2460
    sget v1, Lcom/p1/mobile/android/R$string;->p4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e17\u0e33\u0e07\u0e32\u0e19 \u0e17\u0e33\u0e07\u0e32\u0e19 \u0e17\u0e33\u0e07\u0e32\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2461
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5e72\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2462
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e7e\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2463
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Cheers"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2464
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bersulang"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2465
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e7e\u676f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2466
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac74\ubc30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2467
    sget v1, Lcom/p1/mobile/android/R$string;->x4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e44\u0e0a\u0e42\u0e22"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2468
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7b11yue"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2469
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "LaughToCry"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2470
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Terbahak-bahak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2471
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7b11\u3044\u5410\u304d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2472
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc6c3\ud514"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2473
    sget v1, Lcom/p1/mobile/android/R$string;->y4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2b\u0e31\u0e27\u0e40\u0e23\u0e32\u0e30"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2474
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u593a\u7b0b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2475
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u596a\u7b4d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2476
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Too bad"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2477
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "TooBad"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2478
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Rugi Besar"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2479
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u640d\u5931\u304c\u591a\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2480
    sget v1, Lcom/p1/mobile/android/R$string;->w4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e41\u0e22\u0e48\u0e07\u0e0b\u0e35\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2481
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5c0f\u4e11"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2482
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Joker"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2483
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Badut"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2484
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30d4\u30a8\u30ed"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2485
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc090\uc5d0\ub85c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2486
    sget v1, Lcom/p1/mobile/android/R$string;->z4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e42\u0e08\u0e4a\u0e01\u0e40\u0e01\u0e2d\u0e23\u0e4c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2487
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8fa3\u9e21"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2488
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5566\u5630"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2489
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    move-object/from16 v2, v16

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2490
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Pecundang"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2491
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u82e6\u624b\u304f\u305d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2492
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub9e4\ucf64"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2493
    sget v1, Lcom/p1/mobile/android/R$string;->A4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e44\u0e01\u0e48\u0e23\u0e2a\u0e40\u0e1c\u0e47\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2494
    sget v1, Lcom/p1/mobile/android/R$string;->B4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "yyds"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2495
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u634f\u8138"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2496
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u634f\u81c9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2497
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "PinchFace"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2498
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Cubit Wajah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2499
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u9854\u3092\u637b\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2500
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ucc0c\ub9bf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2501
    sget v1, Lcom/p1/mobile/android/R$string;->C4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2b\u0e22\u0e34\u0e01\u0e2b\u0e19\u0e49\u0e32"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2502
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u592a\u7231\u4e86"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2503
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u592a\u611b\u4e86"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2504
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "LoveIt"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2505
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Suka"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2506
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5927\u597d\u304d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2507
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub108\ubb34 \uc88b\uc544"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2508
    sget v1, Lcom/p1/mobile/android/R$string;->D4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e19\u0e48\u0e32\u0e23\u0e31\u0e01\u0e21\u0e32\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2509
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6c14\u5230\u70b8\u88c2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2510
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6c23\u5230\u7206\u70b8"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2511
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Rage"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2512
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Terbelah"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2513
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u3081\u3063\u3061\u3083\u6012\u3063\u305f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2514
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ubd84\ub178"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2515
    sget v1, Lcom/p1/mobile/android/R$string;->E4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e42\u0e01\u0e23\u0e18\u0e21\u0e32\u0e01\u0e46"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2516
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6253call"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2517
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "GoGo"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2518
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Menyemangati"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2519
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5fdc\u63f4\u3059\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2520
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ucf5c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2521
    sget v1, Lcom/p1/mobile/android/R$string;->F4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e40\u0e23\u0e35\u0e22\u0e01"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2522
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u808c\u8089"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2523
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Muscle"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2524
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Otot"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2525
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7b4b\u8089"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2526
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uadfc\uc721"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2527
    sget v1, Lcom/p1/mobile/android/R$string;->G4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e01\u0e25\u0e49\u0e32\u0e21\u0e40\u0e19\u0e37\u0e49\u0e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2528
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6253\u5de5\u4eba"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2529
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Worker"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2530
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Pekerja"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2531
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u793e\u755c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2532
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub178\ub3d9\uc790"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2533
    sget v1, Lcom/p1/mobile/android/R$string;->H4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e04\u0e19\u0e17\u0e33\u0e07\u0e32\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2534
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4f5b\u7cfb"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2535
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Nevermind"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2536
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Damai"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2537
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8349\u98df\u7cfb"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2538
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc544\ubbf8\ud0c0\ubd88"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2539
    sget v1, Lcom/p1/mobile/android/R$string;->I4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e0a\u0e34\u0e27\u0e46"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2540
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u70ed\u5316\u4e86"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2541
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u71b1\u5316\u4e86"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2542
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Boiling"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2543
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mendidih"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2544
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u71b1\u3059\u304e\u3066\u6eb6\u3051\u308b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2545
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub179\uc74c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2546
    sget v1, Lcom/p1/mobile/android/R$string;->J4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e23\u0e49\u0e2d\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2547
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u4e0d\u8981\u60f3"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2548
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Do not want"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2549
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Tidak mau"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2550
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u8003\u3048\u306a\u3044"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2551
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uc2eb\uc5b4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2552
    sget v1, Lcom/p1/mobile/android/R$string;->K4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2d\u0e22\u0e48\u0e32\u0e44\u0e1b\u0e04\u0e34\u0e14"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2553
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6211\u597d\u65b9"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2554
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Confused"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2555
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bingung"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2556
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u614c\u3066"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2557
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ud63c\ub780"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2558
    sget v1, Lcom/p1/mobile/android/R$string;->L4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e09\u0e31\u0e19\u0e2a\u0e31\u0e1a\u0e2a\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2559
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5934\u79c3"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2560
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u982d\u79bf"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2561
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Bold"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2562
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Botak"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2563
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u30cf\u30b2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2564
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ub300\uba38\ub9ac"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2565
    sget v1, Lcom/p1/mobile/android/R$string;->M4:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2b\u0e31\u0e27\u0e25\u0e49\u0e32\u0e19"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2566
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u656c\u793c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2567
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u656c\u79ae"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2568
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Respect"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2569
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Hormat"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2570
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uacbd\ub840"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2571
    sget v1, Lcom/p1/mobile/android/R$string;->U3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e04\u0e33\u0e19\u0e31\u0e1a"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2572
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u6233\u624b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2573
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Poke"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2574
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Mencolek"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2575
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u7a81\u304d\u6307"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2576
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\ucfe1\ucfe1"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2577
    sget v1, Lcom/p1/mobile/android/R$string;->V3:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e2a\u0e30\u0e01\u0e34\u0e14\u0e21\u0e37\u0e2d"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2578
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u5feb\u54ed\u4e86"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2579
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "TearingUp"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2580
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u307b\u3068\u3093\u3069\u6ce3\u304f"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2581
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\uac70\uc758 \uc6b8\ub2e4"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2582
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "Menangis"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2583
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "g\u1ea7n nh\u01b0 kh\u00f3c"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2584
    sget v1, Lcom/p1/mobile/android/R$string;->D7:I

    invoke-static {v1}, Ll/oze;->k(I)Ll/oze$a;

    move-result-object v1

    const-string v2, "\u0e40\u0e01\u0e37\u0e2d\u0e1a\u0e23\u0e49\u0e2d\u0e07\u0e44\u0e2b\u0e49"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/text/Spannable;ILl/c7m;Z)V
    .locals 11

    .line 1
    sget-object v0, Ll/oze;->a:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->group()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    sub-int/2addr v2, v3

    .line 27
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ll/oze;->j:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Ll/oze$a;

    .line 54
    .line 55
    iget v4, v4, Ll/oze$a;->c:I

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    int-to-double v3, v3

    .line 66
    const-wide v7, 0x3feccccccccccccdL    # 0.9

    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    mul-double/2addr v3, v7

    .line 72
    double-to-int v3, v3

    .line 73
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    int-to-double v4, v4

    .line 78
    mul-double/2addr v4, v7

    .line 79
    double-to-int v4, v4

    .line 80
    const/4 v5, 0x0

    .line 81
    invoke-virtual {v6, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    const-class v5, Ll/fu0;

    .line 93
    .line 94
    invoke-interface {p1, v3, v4, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    if-eqz v3, :cond_1

    .line 99
    .line 100
    array-length v3, v3

    .line 101
    if-nez v3, :cond_0

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_0
    move-object v5, p0

    .line 105
    move v7, p2

    .line 106
    move-object v9, p3

    .line 107
    move v10, p4

    .line 108
    goto :goto_2

    .line 109
    :cond_1
    :goto_1
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    move-object v8, v1

    .line 114
    check-cast v8, Ll/oze$a;

    .line 115
    .line 116
    move-object v5, p0

    .line 117
    move v7, p2

    .line 118
    move-object v9, p3

    .line 119
    move v10, p4

    .line 120
    invoke-static/range {v5 .. v10}, Ll/oze;->e(Landroid/content/Context;Landroid/graphics/drawable/Drawable;ILl/oze$a;Ll/c7m;Z)Ll/fu0;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 129
    .line 130
    .line 131
    move-result p3

    .line 132
    const/16 p4, 0x21

    .line 133
    .line 134
    invoke-interface {p1, p0, p2, p3, p4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 135
    .line 136
    .line 137
    :goto_2
    move-object p0, v5

    .line 138
    move p2, v7

    .line 139
    move-object p3, v9

    .line 140
    move p4, v10

    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_2
    return-void
.end method

.method public static b(Landroid/content/Context;Landroid/text/Spannable;Ljava/lang/String;IIILl/c7m;Z)V
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    sget-object v4, Ll/oze;->a:Ljava/util/regex/Pattern;

    .line 10
    .line 11
    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v5, 0x0

    .line 16
    move v6, v5

    .line 17
    :cond_0
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    const/4 v8, 0x1

    .line 22
    if-eqz v7, :cond_1

    .line 23
    .line 24
    add-int/lit8 v6, v6, 0x1

    .line 25
    .line 26
    move-object/from16 v9, p0

    .line 27
    .line 28
    move/from16 v11, p5

    .line 29
    .line 30
    move-object/from16 v13, p6

    .line 31
    .line 32
    move/from16 v14, p7

    .line 33
    .line 34
    if-le v6, v8, :cond_0

    .line 35
    .line 36
    invoke-static {v9, v0, v11, v13, v14}, Ll/oze;->a(Landroid/content/Context;Landroid/text/Spannable;ILl/c7m;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    move-object/from16 v9, p0

    .line 41
    .line 42
    move/from16 v11, p5

    .line 43
    .line 44
    move-object/from16 v13, p6

    .line 45
    .line 46
    move/from16 v14, p7

    .line 47
    .line 48
    if-ne v6, v8, :cond_3

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    sub-int/2addr v4, v8

    .line 55
    invoke-virtual {v1, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget-object v4, Ll/oze;->j:Ljava/util/Map;

    .line 60
    .line 61
    invoke-interface {v4, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-eqz v6, :cond_3

    .line 66
    .line 67
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    if-eqz v6, :cond_3

    .line 72
    .line 73
    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    check-cast v7, Ll/oze$a;

    .line 82
    .line 83
    iget v7, v7, Ll/oze$a;->c:I

    .line 84
    .line 85
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object v10

    .line 89
    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    int-to-double v6, v6

    .line 94
    const-wide v15, 0x3feccccccccccccdL    # 0.9

    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    mul-double/2addr v6, v15

    .line 100
    double-to-int v6, v6

    .line 101
    invoke-virtual {v10}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 102
    .line 103
    .line 104
    move-result v7

    .line 105
    int-to-double v7, v7

    .line 106
    mul-double/2addr v7, v15

    .line 107
    double-to-int v7, v7

    .line 108
    invoke-virtual {v10, v5, v5, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 109
    .line 110
    .line 111
    const-class v5, Ll/fu0;

    .line 112
    .line 113
    invoke-interface {v0, v2, v3, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    if-eqz v5, :cond_2

    .line 118
    .line 119
    array-length v5, v5

    .line 120
    if-nez v5, :cond_3

    .line 121
    .line 122
    :cond_2
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    move-object v12, v1

    .line 127
    check-cast v12, Ll/oze$a;

    .line 128
    .line 129
    invoke-static/range {v9 .. v14}, Ll/oze;->e(Landroid/content/Context;Landroid/graphics/drawable/Drawable;ILl/oze$a;Ll/c7m;Z)Ll/fu0;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    const/16 v4, 0x21

    .line 134
    .line 135
    invoke-interface {v0, v1, v2, v3, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method

.method public static c(Landroid/content/Context;Landroid/text/Spannable;IILl/c7m;Z)V
    .locals 11

    .line 1
    sget-object v0, Ll/oze;->a:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->group()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    sub-int/2addr v2, v3

    .line 27
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ll/oze;->j:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Ll/oze$a;

    .line 54
    .line 55
    iget v4, v4, Ll/oze$a;->c:I

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    const/4 v3, 0x0

    .line 62
    invoke-virtual {v6, v3, v3, p2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    const-class v5, Ll/fu0;

    .line 74
    .line 75
    invoke-interface {p1, v3, v4, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    array-length v3, v3

    .line 82
    if-nez v3, :cond_0

    .line 83
    .line 84
    :cond_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    sub-int/2addr v3, v4

    .line 93
    if-lez v3, :cond_0

    .line 94
    .line 95
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    move-object v8, v1

    .line 100
    check-cast v8, Ll/oze$a;

    .line 101
    .line 102
    move-object v5, p0

    .line 103
    move v7, p3

    .line 104
    move-object v9, p4

    .line 105
    move/from16 v10, p5

    .line 106
    .line 107
    invoke-static/range {v5 .. v10}, Ll/oze;->e(Landroid/content/Context;Landroid/graphics/drawable/Drawable;ILl/oze$a;Ll/c7m;Z)Ll/fu0;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    const/16 v4, 0x21

    .line 120
    .line 121
    invoke-interface {p1, v1, v2, v3, v4}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    return-void
.end method

.method public static d(Landroid/content/Context;Landroid/text/Spannable;Ll/c7m;Z)V
    .locals 11

    .line 1
    sget-object v0, Ll/oze;->a:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->group()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x1

    .line 26
    sub-int/2addr v2, v3

    .line 27
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Ll/oze;->j:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_0

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    check-cast v4, Ll/oze$a;

    .line 54
    .line 55
    iget v4, v4, Ll/oze$a;->d:I

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    const/4 v5, 0x0

    .line 76
    invoke-virtual {v6, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    const-class v5, Ll/fu0;

    .line 88
    .line 89
    invoke-interface {p1, v3, v4, v5}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    if-eqz v3, :cond_1

    .line 94
    .line 95
    array-length v3, v3

    .line 96
    if-nez v3, :cond_0

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_0
    move-object v5, p0

    .line 100
    move-object v9, p2

    .line 101
    move v10, p3

    .line 102
    goto :goto_2

    .line 103
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    sub-int/2addr v3, v4

    .line 112
    if-lez v3, :cond_0

    .line 113
    .line 114
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    move-object v8, v1

    .line 119
    check-cast v8, Ll/oze$a;

    .line 120
    .line 121
    const/4 v7, 0x0

    .line 122
    move-object v5, p0

    .line 123
    move-object v9, p2

    .line 124
    move v10, p3

    .line 125
    invoke-static/range {v5 .. v10}, Ll/oze;->e(Landroid/content/Context;Landroid/graphics/drawable/Drawable;ILl/oze$a;Ll/c7m;Z)Ll/fu0;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    const/16 v1, 0x21

    .line 138
    .line 139
    invoke-interface {p1, p0, p2, p3, v1}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 140
    .line 141
    .line 142
    :goto_2
    move-object p0, v5

    .line 143
    move-object p2, v9

    .line 144
    move p3, v10

    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public static e(Landroid/content/Context;Landroid/graphics/drawable/Drawable;ILl/oze$a;Ll/c7m;Z)Ll/fu0;
    .locals 0

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/fu0;

    .line 4
    .line 5
    iget p2, p3, Ll/oze$a;->b:I

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    iget p3, p3, Ll/oze$a;->d:I

    .line 12
    .line 13
    invoke-direct {p1, p0, p2, p3, p4}, Ll/fu0;-><init>(Landroid/content/Context;Ljava/lang/String;ILl/c7m;)V

    .line 14
    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    new-instance p0, Ll/fu0;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Ll/fu0;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public static f(Landroid/content/Context;Ljava/lang/CharSequence;ILl/c7m;Z)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0, p2, p3, p4}, Ll/oze;->a(Landroid/content/Context;Landroid/text/Spannable;ILl/c7m;Z)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static g(Landroid/content/Context;Ljava/lang/CharSequence;FILl/c7m;Z)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    move-object v0, p1

    .line 9
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 10
    .line 11
    invoke-direct {p1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const v0, 0x3fb33333    # 1.4f

    .line 15
    .line 16
    .line 17
    mul-float/2addr p2, v0

    .line 18
    float-to-int p2, p2

    .line 19
    invoke-static/range {p0 .. p5}, Ll/oze;->c(Landroid/content/Context;Landroid/text/Spannable;IILl/c7m;Z)V

    .line 20
    .line 21
    .line 22
    return-object p1
.end method

.method public static h(Landroid/content/Context;Ljava/lang/CharSequence;Ll/c7m;Z)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0, p2, p3}, Ll/oze;->d(Landroid/content/Context;Landroid/text/Spannable;Ll/c7m;Z)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static i()V
    .locals 0

    .line 1
    return-void
.end method

.method public static j()V
    .locals 28

    .line 1
    sget-object v0, Ll/oze;->e:Ljava/util/ArrayList;

    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D6:I

    sget v3, Ll/abc0;->s5:I

    sget v4, Ll/abc0;->t5:I

    const-string v5, "EMOTICON_SMILE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m8:I

    sget v3, Ll/abc0;->a3:I

    sget v4, Ll/abc0;->b3:I

    const-string v6, "NEW_EMOJI_TITTER"

    invoke-direct {v1, v6, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n7:I

    sget v3, Ll/abc0;->W1:I

    sget v4, Ll/abc0;->X1:I

    const-string v7, "NEW_EMOJI_AH"

    invoke-direct {v1, v7, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p5:I

    sget v3, Ll/abc0;->U3:I

    sget v4, Ll/abc0;->V3:I

    const-string v8, "EMOTICON_CRY"

    invoke-direct {v1, v8, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 5
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b4:I

    sget v3, Ll/abc0;->y0:I

    sget v4, Ll/abc0;->z0:I

    const-string v9, "EMOJI_50"

    invoke-direct {v1, v9, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 6
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J6:I

    sget v3, Ll/abc0;->C5:I

    sget v4, Ll/abc0;->D5:I

    const-string v10, "EMOTICON_STUPEFIED"

    invoke-direct {v1, v10, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S4:I

    sget v3, Ll/abc0;->s3:I

    sget v4, Ll/abc0;->t3:I

    const-string v11, "EMOTICON_AWKWARD"

    invoke-direct {v1, v11, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p6:I

    sget v3, Ll/abc0;->a5:I

    sget v4, Ll/abc0;->b5:I

    const-string v12, "EMOTICON_SAD"

    invoke-direct {v1, v12, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K3:I

    sget v3, Ll/abc0;->Q:I

    sget v4, Ll/abc0;->R:I

    const-string v13, "EMOJI_20"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 10
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P5:I

    sget v3, Ll/abc0;->A4:I

    sget v4, Ll/abc0;->B4:I

    const-string v14, "EMOTICON_JOYFUL"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 11
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P7:I

    sget v3, Ll/abc0;->w2:I

    sget v4, Ll/abc0;->x2:I

    const-string v15, "NEW_EMOJI_LEISURELY"

    invoke-direct {v1, v15, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V5:I

    sget v3, Ll/abc0;->F4:I

    sget v4, Ll/abc0;->G4:I

    move-object/from16 v16, v15

    const-string v15, "EMOTICON_LIPS_SEALED"

    invoke-direct {v1, v15, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B3:I

    sget v3, Ll/abc0;->A5:I

    sget v4, Ll/abc0;->B5:I

    move-object/from16 v17, v15

    const-string v15, "EMOJI_10"

    invoke-direct {v1, v15, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N5:I

    sget v3, Ll/abc0;->y4:I

    sget v4, Ll/abc0;->z4:I

    move-object/from16 v18, v14

    const-string v14, "EMOTICON_HOT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z3:I

    sget v3, Ll/abc0;->u0:I

    sget v4, Ll/abc0;->v0:I

    move-object/from16 v19, v13

    const-string v13, "EMOJI_47"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j6:I

    sget v3, Ll/abc0;->Y4:I

    sget v4, Ll/abc0;->Z4:I

    move-object/from16 v20, v13

    const-string v13, "EMOTICON_QUESTION"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C3:I

    sget v3, Ll/abc0;->A:I

    sget v4, Ll/abc0;->B:I

    move-object/from16 v21, v13

    const-string v13, "EMOJI_11"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r4:I

    sget v3, Ll/abc0;->b1:I

    sget v4, Ll/abc0;->c1:I

    move-object/from16 v22, v13

    const-string v13, "EMOJI_69"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N7:I

    sget v3, Ll/abc0;->s2:I

    sget v4, Ll/abc0;->t2:I

    move-object/from16 v23, v13

    const-string v13, "NEW_EMOJI_HAHE"

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T7:I

    sget v3, Ll/abc0;->C2:I

    sget v4, Ll/abc0;->D2:I

    move-object/from16 v24, v14

    const-string v14, "NEW_EMOJI_NOSE_PICKING"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C5:I

    sget v3, Ll/abc0;->m4:I

    sget v4, Ll/abc0;->n4:I

    move-object/from16 v25, v14

    const-string v14, "EMOTICON_FROWN"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S6:I

    sget v3, Ll/abc0;->Q5:I

    sget v4, Ll/abc0;->R5:I

    move-object/from16 v26, v14

    const-string v14, "EMOTICON_TRICK"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q8:I

    sget v3, Ll/abc0;->e3:I

    sget v4, Ll/abc0;->f3:I

    move-object/from16 v27, v14

    const-string v14, "NEW_EMOJI_WATERMELON"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F7:I

    sget v3, Ll/abc0;->k2:I

    sget v4, Ll/abc0;->l2:I

    const-string v14, "NEW_EMOJI_DESPISE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m4:I

    sget v3, Ll/abc0;->T0:I

    sget v4, Ll/abc0;->U0:I

    const-string v14, "EMOJI_61"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 26
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P3:I

    sget v3, Ll/abc0;->a0:I

    sget v4, Ll/abc0;->b0:I

    const-string v14, "EMOJI_27"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q3:I

    sget v3, Ll/abc0;->c0:I

    sget v4, Ll/abc0;->d0:I

    const-string v14, "EMOJI_29"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r8:I

    sget v3, Ll/abc0;->g3:I

    sget v4, Ll/abc0;->h3:I

    const-string v14, "NEW_EMOJI_WIPE_SWEAT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q7:I

    sget v3, Ll/abc0;->Y1:I

    sget v4, Ll/abc0;->Z1:I

    const-string v14, "NEW_EMOJI_APPLAUSE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M7:I

    sget v3, Ll/abc0;->c6:I

    sget v4, Ll/abc0;->d6:I

    const-string v14, "NEW_EMOJI_GRIEVANCES"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->k4:I

    sget v3, Ll/abc0;->Q0:I

    sget v4, Ll/abc0;->d1:I

    const-string v14, "EMOJI_6"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q4:I

    sget v3, Ll/abc0;->o3:I

    sget v4, Ll/abc0;->p3:I

    const-string v14, "EMOTICON_ANGRY"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R4:I

    sget v3, Ll/abc0;->q3:I

    sget v4, Ll/abc0;->r3:I

    const-string v14, "EMOTICON_ANGRY_Y"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c4:I

    sget v3, Ll/abc0;->A0:I

    sget v4, Ll/abc0;->B0:I

    const-string v14, "EMOJI_51"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s4:I

    sget v3, Ll/abc0;->e1:I

    sget v4, Ll/abc0;->f1:I

    const-string v14, "EMOJI_70"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I7:I

    sget v3, Ll/abc0;->m2:I

    sget v4, Ll/abc0;->n2:I

    const-string v14, "NEW_EMOJI_FEAR"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z7:I

    sget v3, Ll/abc0;->O2:I

    sget v4, Ll/abc0;->P2:I

    const-string v14, "NEW_EMOJI_SHH"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R7:I

    sget v3, Ll/abc0;->A2:I

    sget v4, Ll/abc0;->B2:I

    const-string v14, "NEW_EMOJI_LOVE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q5:I

    sget v3, Ll/abc0;->C4:I

    sget v4, Ll/abc0;->D4:I

    const-string v14, "EMOTICON_KISS"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v5:I

    sget v3, Ll/abc0;->Q4:I

    sget v4, Ll/abc0;->R4:I

    const-string v14, "EMOTICON_DOH"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s8:I

    sget v3, Ll/abc0;->i3:I

    sget v4, Ll/abc0;->j3:I

    const-string v14, "NEW_EMOJI_WITTY"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c5:I

    sget v3, Ll/abc0;->C3:I

    sget v4, Ll/abc0;->D3:I

    const-string v14, "EMOTICON_BYE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g8:I

    sget v3, Ll/abc0;->W2:I

    sget v4, Ll/abc0;->X2:I

    const-string v14, "NEW_EMOJI_SINISTER_SMILE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V3:I

    sget v3, Ll/abc0;->m0:I

    sget v4, Ll/abc0;->n0:I

    const-string v14, "EMOJI_42"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O5:I

    sget v3, Ll/abc0;->u2:I

    sget v4, Ll/abc0;->v2:I

    const-string v14, "EMOTICON_HUG"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D7:I

    sget v3, Ll/abc0;->i2:I

    sget v4, Ll/abc0;->j2:I

    const-string v14, "NEW_EMOJI_CRYING"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S3:I

    sget v3, Ll/abc0;->g0:I

    sget v4, Ll/abc0;->h0:I

    const-string v14, "EMOJI_31"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y6:I

    sget v3, Ll/abc0;->Y5:I

    sget v4, Ll/abc0;->Z5:I

    const-string v14, "EMOTICON_WHIMPER"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I3:I

    sget v3, Ll/abc0;->M:I

    sget v4, Ll/abc0;->N:I

    const-string v14, "EMOJI_18"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C6:I

    sget v3, Ll/abc0;->q5:I

    sget v4, Ll/abc0;->r5:I

    const-string v14, "EMOTICON_SLY"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T6:I

    sget v3, Ll/abc0;->S5:I

    sget v4, Ll/abc0;->T5:I

    const-string v14, "EMOTICON_UNDECIDED"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d4:I

    sget v3, Ll/abc0;->C0:I

    sget v4, Ll/abc0;->D0:I

    const-string v14, "EMOJI_52"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e4:I

    sget v3, Ll/abc0;->E0:I

    sget v4, Ll/abc0;->F0:I

    const-string v14, "EMOJI_53"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T3:I

    sget v3, Ll/abc0;->i0:I

    sget v4, Ll/abc0;->j0:I

    const-string v14, "EMOJI_40"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R3:I

    sget v3, Ll/abc0;->e0:I

    sget v4, Ll/abc0;->f0:I

    const-string v14, "EMOJI_30"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C4:I

    sget v3, Ll/abc0;->y1:I

    sget v4, Ll/abc0;->z1:I

    const-string v14, "EMOJI_81"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d7:I

    sget v3, Ll/abc0;->g6:I

    sget v4, Ll/abc0;->h6:I

    const-string v14, "EMOTICON_YEAH"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o8:I

    sget v3, Ll/abc0;->c3:I

    sget v4, Ll/abc0;->d3:I

    const-string v14, "NEW_EMOJI_VOMIT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a8:I

    sget v3, Ll/abc0;->Q2:I

    sget v4, Ll/abc0;->R2:I

    const-string v14, "NEW_EMOJI_SHOCK"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D4:I

    sget v3, Ll/abc0;->A1:I

    sget v4, Ll/abc0;->B1:I

    const-string v14, "EMOJI_82"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->W3:I

    sget v3, Ll/abc0;->o0:I

    sget v4, Ll/abc0;->p0:I

    const-string v14, "EMOJI_44"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e8:I

    sget v3, Ll/abc0;->U2:I

    sget v4, Ll/abc0;->V2:I

    const-string v14, "NEW_EMOJI_SILENT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M3:I

    sget v3, Ll/abc0;->U:I

    sget v4, Ll/abc0;->V:I

    const-string v14, "EMOJI_23"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G3:I

    sget v3, Ll/abc0;->I:I

    sget v4, Ll/abc0;->J:I

    const-string v14, "EMOJI_16"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X3:I

    sget v3, Ll/abc0;->q0:I

    sget v4, Ll/abc0;->r0:I

    const-string v14, "EMOJI_45"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O3:I

    sget v3, Ll/abc0;->Y:I

    sget v4, Ll/abc0;->Z:I

    const-string v14, "EMOJI_26"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U3:I

    sget v3, Ll/abc0;->k0:I

    sget v4, Ll/abc0;->l0:I

    const-string v14, "EMOJI_41"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l5:I

    sget v3, Ll/abc0;->Q3:I

    sget v4, Ll/abc0;->R3:I

    const-string v14, "EMOTICON_CONFUSED"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L4:I

    sget v3, Ll/abc0;->Q1:I

    sget v4, Ll/abc0;->R1:I

    const-string v14, "EMOJI_90"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d8:I

    sget v3, Ll/abc0;->S2:I

    sget v4, Ll/abc0;->T2:I

    const-string v14, "NEW_EMOJI_SICK"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H3:I

    sget v3, Ll/abc0;->K:I

    sget v4, Ll/abc0;->L:I

    const-string v14, "EMOJI_17"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K4:I

    sget v3, Ll/abc0;->O1:I

    sget v4, Ll/abc0;->P1:I

    const-string v14, "EMOJI_89"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I4:I

    sget v3, Ll/abc0;->K1:I

    sget v4, Ll/abc0;->L1:I

    const-string v14, "EMOJI_87"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N3:I

    sget v3, Ll/abc0;->W:I

    sget v4, Ll/abc0;->X:I

    const-string v14, "EMOJI_24"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n4:I

    sget v3, Ll/abc0;->V0:I

    sget v4, Ll/abc0;->W0:I

    const-string v14, "EMOJI_62"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b5:I

    sget v3, Ll/abc0;->A3:I

    sget v4, Ll/abc0;->B3:I

    const-string v14, "EMOTICON_BROKENHEART"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J4:I

    sget v3, Ll/abc0;->M1:I

    sget v4, Ll/abc0;->N1:I

    const-string v14, "EMOJI_88"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u5:I

    sget v3, Ll/abc0;->k4:I

    sget v4, Ll/abc0;->l4:I

    const-string v14, "EMOTICON_DISAPPOINTED"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F4:I

    sget v3, Ll/abc0;->E1:I

    sget v4, Ll/abc0;->F1:I

    const-string v14, "EMOJI_84"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F3:I

    sget v3, Ll/abc0;->G:I

    sget v4, Ll/abc0;->H:I

    const-string v14, "EMOJI_15"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N4:I

    sget v3, Ll/abc0;->U1:I

    sget v4, Ll/abc0;->V1:I

    const-string v14, "EMOJI_92"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u4:I

    sget v3, Ll/abc0;->i1:I

    sget v4, Ll/abc0;->j1:I

    const-string v14, "EMOJI_73"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->x4:I

    sget v3, Ll/abc0;->o1:I

    sget v4, Ll/abc0;->p1:I

    const-string v14, "EMOJI_76"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y4:I

    sget v3, Ll/abc0;->q1:I

    sget v4, Ll/abc0;->r1:I

    const-string v14, "EMOJI_77"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H4:I

    sget v3, Ll/abc0;->I1:I

    sget v4, Ll/abc0;->J1:I

    const-string v14, "EMOJI_86"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g6:I

    sget v3, Ll/abc0;->U4:I

    sget v4, Ll/abc0;->V4:I

    const-string v14, "EMOTICON_POOH_POOH"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B4:I

    sget v3, Ll/abc0;->w1:I

    sget v4, Ll/abc0;->x1:I

    const-string v14, "EMOJI_80"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a4:I

    sget v3, Ll/abc0;->w0:I

    sget v4, Ll/abc0;->x0:I

    const-string v14, "EMOJI_48"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X5:I

    sget v3, Ll/abc0;->I4:I

    sget v4, Ll/abc0;->J4:I

    const-string v14, "EMOTICON_MASK"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j4:I

    sget v3, Ll/abc0;->O0:I

    sget v4, Ll/abc0;->P0:I

    const-string v14, "EMOJI_59"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t4:I

    sget v3, Ll/abc0;->g1:I

    sget v4, Ll/abc0;->h1:I

    const-string v14, "EMOJI_72"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v4:I

    sget v3, Ll/abc0;->k1:I

    sget v4, Ll/abc0;->l1:I

    const-string v14, "EMOJI_74"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J3:I

    sget v3, Ll/abc0;->O:I

    sget v4, Ll/abc0;->P:I

    const-string v14, "EMOJI_19"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p4:I

    sget v3, Ll/abc0;->Z0:I

    sget v4, Ll/abc0;->a1:I

    const-string v14, "EMOJI_65"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l4:I

    sget v3, Ll/abc0;->R0:I

    sget v4, Ll/abc0;->S0:I

    const-string v14, "EMOJI_60"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E4:I

    sget v3, Ll/abc0;->C1:I

    sget v4, Ll/abc0;->D1:I

    const-string v14, "EMOJI_83"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M4:I

    sget v3, Ll/abc0;->S1:I

    sget v4, Ll/abc0;->T1:I

    const-string v14, "EMOJI_91"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E3:I

    sget v3, Ll/abc0;->E:I

    sget v4, Ll/abc0;->F:I

    const-string v14, "EMOJI_14"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y3:I

    sget v3, Ll/abc0;->s0:I

    sget v4, Ll/abc0;->t0:I

    const-string v14, "EMOJI_46"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 100
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D3:I

    sget v3, Ll/abc0;->C:I

    sget v4, Ll/abc0;->D:I

    const-string v14, "EMOJI_12"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o4:I

    sget v3, Ll/abc0;->X0:I

    sget v4, Ll/abc0;->Y0:I

    const-string v14, "EMOJI_63"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y7:I

    sget v3, Ll/abc0;->M2:I

    sget v4, Ll/abc0;->N2:I

    const-string v14, "NEW_EMOJI_SEDUCTION"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d6:I

    sget v3, Ll/abc0;->S4:I

    sget v4, Ll/abc0;->T4:I

    const-string v14, "EMOTICON_PEACE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B5:I

    sget v3, Ll/abc0;->i4:I

    sget v4, Ll/abc0;->j4:I

    const-string v14, "EMOTICON_FIST"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L3:I

    sget v3, Ll/abc0;->S:I

    sget v4, Ll/abc0;->T:I

    const-string v14, "EMOJI_21"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P6:I

    sget v3, Ll/abc0;->M5:I

    sget v4, Ll/abc0;->N5:I

    const-string v14, "EMOTICON_THUMBS_UP"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O6:I

    sget v3, Ll/abc0;->K5:I

    sget v4, Ll/abc0;->L5:I

    const-string v14, "EMOTICON_THUMBS_DOWN"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v6:I

    sget v3, Ll/abc0;->i5:I

    sget v4, Ll/abc0;->j5:I

    const-string v14, "EMOTICON_SHAKE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G4:I

    sget v3, Ll/abc0;->G1:I

    sget v4, Ll/abc0;->H1:I

    const-string v14, "EMOJI_85"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t7:I

    sget v3, Ll/abc0;->m3:I

    sget v4, Ll/abc0;->n3:I

    const-string v14, "NEW_EMOJI_BAOQUAN"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l8:I

    sget v3, Ll/abc0;->Y2:I

    sget v4, Ll/abc0;->Z2:I

    const-string v14, "NEW_EMOJI_THS"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q7:I

    sget v3, Ll/abc0;->y2:I

    sget v4, Ll/abc0;->z2:I

    const-string v14, "NEW_EMOJI_LIPS"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o6:I

    sget v3, Ll/abc0;->K2:I

    sget v4, Ll/abc0;->L2:I

    const-string v14, "EMOTICON_ROSE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z6:I

    sget v3, Ll/abc0;->a6:I

    sget v4, Ll/abc0;->b6:I

    const-string v14, "EMOTICON_WILT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v7:I

    sget v3, Ll/abc0;->a2:I

    sget v4, Ll/abc0;->b2:I

    const-string v14, "NEW_EMOJI_BEER"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i5:I

    sget v3, Ll/abc0;->K3:I

    sget v4, Ll/abc0;->L3:I

    const-string v14, "EMOTICON_COFFEE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d5:I

    sget v3, Ll/abc0;->k3:I

    sget v4, Ll/abc0;->l3:I

    const-string v14, "EMOTICON_CAKE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L7:I

    sget v3, Ll/abc0;->q2:I

    sget v4, Ll/abc0;->r2:I

    const-string v14, "NEW_EMOJI_GIFT"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B7:I

    sget v3, Ll/abc0;->g2:I

    sget v4, Ll/abc0;->h2:I

    const-string v14, "NEW_EMOJI_CELEBRATE"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h4:I

    sget v3, Ll/abc0;->K0:I

    sget v4, Ll/abc0;->L0:I

    const-string v14, "EMOJI_57"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g4:I

    sget v3, Ll/abc0;->I0:I

    sget v4, Ll/abc0;->J0:I

    const-string v14, "EMOJI_56"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w7:I

    sget v3, Ll/abc0;->c2:I

    sget v4, Ll/abc0;->d2:I

    const-string v14, "NEW_EMOJI_BLESSING"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h5:I

    sget v3, Ll/abc0;->I3:I

    sget v4, Ll/abc0;->J3:I

    const-string v14, "EMOTICON_CLEAVER"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h6:I

    sget v3, Ll/abc0;->G2:I

    sget v4, Ll/abc0;->H2:I

    const-string v14, "EMOTICON_POOP"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y7:I

    sget v3, Ll/abc0;->e2:I

    sget v4, Ll/abc0;->f2:I

    const-string v14, "NEW_EMOJI_BOMB"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K7:I

    sget v3, Ll/abc0;->o2:I

    sget v4, Ll/abc0;->p2:I

    const-string v14, "NEW_EMOJI_GET_RICH"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V7:I

    sget v3, Ll/abc0;->I2:I

    sget v4, Ll/abc0;->J2:I

    const-string v14, "NEW_EMOJI_RED_ENVELOPES"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 128
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i4:I

    sget v3, Ll/abc0;->M0:I

    sget v4, Ll/abc0;->N0:I

    const-string v14, "EMOJI_58"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->f4:I

    sget v3, Ll/abc0;->G0:I

    sget v4, Ll/abc0;->H0:I

    const-string v14, "EMOJI_54"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->A4:I

    sget v3, Ll/abc0;->u1:I

    sget v4, Ll/abc0;->v1:I

    const-string v14, "EMOJI_79"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U7:I

    sget v3, Ll/abc0;->E2:I

    sget v4, Ll/abc0;->F2:I

    const-string v14, "NEW_EMOJI_PIGHEAD"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w4:I

    sget v3, Ll/abc0;->m1:I

    sget v4, Ll/abc0;->n1:I

    const-string v14, "EMOJI_75"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->z4:I

    sget v3, Ll/abc0;->s1:I

    sget v4, Ll/abc0;->t1:I

    const-string v14, "EMOJI_78"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K6:I

    sget v3, Ll/abc0;->E5:I

    sget v4, Ll/abc0;->F5:I

    const-string v14, "EMOTICON_SUN"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y5:I

    sget v3, Ll/abc0;->K4:I

    sget v4, Ll/abc0;->L4:I

    const-string v14, "EMOTICON_MOON"

    invoke-direct {v1, v14, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    sget-object v0, Ll/oze;->f:Ljava/util/ArrayList;

    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D6:I

    sget v3, Ll/abc0;->s5:I

    sget v4, Ll/abc0;->t5:I

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N7:I

    sget v3, Ll/abc0;->s2:I

    sget v4, Ll/abc0;->t2:I

    invoke-direct {v1, v13, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n7:I

    sget v3, Ll/abc0;->W1:I

    sget v4, Ll/abc0;->X1:I

    invoke-direct {v1, v7, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B3:I

    sget v3, Ll/abc0;->A5:I

    sget v4, Ll/abc0;->B5:I

    invoke-direct {v1, v15, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R7:I

    sget v3, Ll/abc0;->A2:I

    sget v4, Ll/abc0;->B2:I

    const-string v5, "NEW_EMOJI_LOVE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p5:I

    sget v3, Ll/abc0;->U3:I

    sget v4, Ll/abc0;->V3:I

    invoke-direct {v1, v8, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m8:I

    sget v3, Ll/abc0;->a3:I

    sget v4, Ll/abc0;->b3:I

    invoke-direct {v1, v6, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s4:I

    sget v3, Ll/abc0;->e1:I

    sget v4, Ll/abc0;->f1:I

    const-string v5, "EMOJI_70"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b4:I

    sget v3, Ll/abc0;->y0:I

    sget v4, Ll/abc0;->z0:I

    invoke-direct {v1, v9, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J6:I

    sget v3, Ll/abc0;->C5:I

    sget v4, Ll/abc0;->D5:I

    invoke-direct {v1, v10, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p6:I

    sget v3, Ll/abc0;->a5:I

    sget v4, Ll/abc0;->b5:I

    invoke-direct {v1, v12, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S4:I

    sget v3, Ll/abc0;->s3:I

    sget v4, Ll/abc0;->t3:I

    invoke-direct {v1, v11, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N5:I

    sget v3, Ll/abc0;->y4:I

    sget v4, Ll/abc0;->z4:I

    move-object/from16 v5, v24

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K3:I

    sget v3, Ll/abc0;->Q:I

    sget v4, Ll/abc0;->R:I

    move-object/from16 v5, v19

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P5:I

    sget v3, Ll/abc0;->A4:I

    sget v4, Ll/abc0;->B4:I

    move-object/from16 v5, v18

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P7:I

    sget v3, Ll/abc0;->w2:I

    sget v4, Ll/abc0;->x2:I

    move-object/from16 v5, v16

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V5:I

    sget v3, Ll/abc0;->F4:I

    sget v4, Ll/abc0;->G4:I

    move-object/from16 v5, v17

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S6:I

    sget v3, Ll/abc0;->Q5:I

    sget v4, Ll/abc0;->R5:I

    move-object/from16 v5, v27

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z3:I

    sget v3, Ll/abc0;->u0:I

    sget v4, Ll/abc0;->v0:I

    move-object/from16 v5, v20

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C3:I

    sget v3, Ll/abc0;->A:I

    sget v4, Ll/abc0;->B:I

    move-object/from16 v5, v22

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 156
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j6:I

    sget v3, Ll/abc0;->Y4:I

    sget v4, Ll/abc0;->Z4:I

    move-object/from16 v5, v21

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r4:I

    sget v3, Ll/abc0;->b1:I

    sget v4, Ll/abc0;->c1:I

    move-object/from16 v5, v23

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q8:I

    sget v3, Ll/abc0;->e3:I

    sget v4, Ll/abc0;->f3:I

    const-string v5, "NEW_EMOJI_WATERMELON"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C5:I

    sget v3, Ll/abc0;->m4:I

    sget v4, Ll/abc0;->n4:I

    move-object/from16 v5, v26

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T7:I

    sget v3, Ll/abc0;->C2:I

    sget v4, Ll/abc0;->D2:I

    move-object/from16 v5, v25

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q5:I

    sget v3, Ll/abc0;->C4:I

    sget v4, Ll/abc0;->D4:I

    const-string v5, "EMOTICON_KISS"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->q7:I

    sget v3, Ll/abc0;->Y1:I

    sget v4, Ll/abc0;->Z1:I

    const-string v5, "NEW_EMOJI_APPLAUSE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c4:I

    sget v3, Ll/abc0;->A0:I

    sget v4, Ll/abc0;->B0:I

    const-string v5, "EMOJI_51"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P3:I

    sget v3, Ll/abc0;->a0:I

    sget v4, Ll/abc0;->b0:I

    const-string v5, "EMOJI_27"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->s8:I

    sget v3, Ll/abc0;->i3:I

    sget v4, Ll/abc0;->j3:I

    const-string v5, "NEW_EMOJI_WITTY"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->m4:I

    sget v3, Ll/abc0;->T0:I

    sget v4, Ll/abc0;->U0:I

    const-string v5, "EMOJI_61"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F7:I

    sget v3, Ll/abc0;->k2:I

    sget v4, Ll/abc0;->l2:I

    const-string v5, "NEW_EMOJI_DESPISE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q3:I

    sget v3, Ll/abc0;->c0:I

    sget v4, Ll/abc0;->d0:I

    const-string v5, "EMOJI_29"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M7:I

    sget v3, Ll/abc0;->c6:I

    sget v4, Ll/abc0;->d6:I

    const-string v5, "NEW_EMOJI_GRIEVANCES"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->r8:I

    sget v3, Ll/abc0;->g3:I

    sget v4, Ll/abc0;->h3:I

    const-string v5, "NEW_EMOJI_WIPE_SWEAT"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O5:I

    sget v3, Ll/abc0;->u2:I

    sget v4, Ll/abc0;->v2:I

    const-string v5, "EMOTICON_HUG"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D4:I

    sget v3, Ll/abc0;->A1:I

    sget v4, Ll/abc0;->B1:I

    const-string v5, "EMOJI_82"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->k4:I

    sget v3, Ll/abc0;->Q0:I

    sget v4, Ll/abc0;->d1:I

    const-string v5, "EMOJI_6"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g8:I

    sget v3, Ll/abc0;->W2:I

    sget v4, Ll/abc0;->X2:I

    const-string v5, "NEW_EMOJI_SINISTER_SMILE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v5:I

    sget v3, Ll/abc0;->Q4:I

    sget v4, Ll/abc0;->R4:I

    const-string v5, "EMOTICON_DOH"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->c5:I

    sget v3, Ll/abc0;->C3:I

    sget v4, Ll/abc0;->D3:I

    const-string v5, "EMOTICON_BYE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z7:I

    sget v3, Ll/abc0;->O2:I

    sget v4, Ll/abc0;->P2:I

    const-string v5, "NEW_EMOJI_SHH"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I7:I

    sget v3, Ll/abc0;->m2:I

    sget v4, Ll/abc0;->n2:I

    const-string v5, "NEW_EMOJI_FEAR"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R4:I

    sget v3, Ll/abc0;->q3:I

    sget v4, Ll/abc0;->r3:I

    const-string v5, "EMOTICON_ANGRY_Y"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V3:I

    sget v3, Ll/abc0;->m0:I

    sget v4, Ll/abc0;->n0:I

    const-string v5, "EMOJI_42"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y6:I

    sget v3, Ll/abc0;->Y5:I

    sget v4, Ll/abc0;->Z5:I

    const-string v5, "EMOTICON_WHIMPER"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q4:I

    sget v3, Ll/abc0;->o3:I

    sget v4, Ll/abc0;->p3:I

    const-string v5, "EMOTICON_ANGRY"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C6:I

    sget v3, Ll/abc0;->q5:I

    sget v4, Ll/abc0;->r5:I

    const-string v5, "EMOTICON_SLY"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d4:I

    sget v3, Ll/abc0;->C0:I

    sget v4, Ll/abc0;->D0:I

    const-string v5, "EMOJI_52"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D7:I

    sget v3, Ll/abc0;->i2:I

    sget v4, Ll/abc0;->j2:I

    const-string v5, "NEW_EMOJI_CRYING"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->C4:I

    sget v3, Ll/abc0;->y1:I

    sget v4, Ll/abc0;->z1:I

    const-string v5, "EMOJI_81"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e4:I

    sget v3, Ll/abc0;->E0:I

    sget v4, Ll/abc0;->F0:I

    const-string v5, "EMOJI_53"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U3:I

    sget v3, Ll/abc0;->k0:I

    sget v4, Ll/abc0;->l0:I

    const-string v5, "EMOJI_41"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->S3:I

    sget v3, Ll/abc0;->g0:I

    sget v4, Ll/abc0;->h0:I

    const-string v5, "EMOJI_31"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 190
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->W3:I

    sget v3, Ll/abc0;->o0:I

    sget v4, Ll/abc0;->p0:I

    const-string v5, "EMOJI_44"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d7:I

    sget v3, Ll/abc0;->g6:I

    sget v4, Ll/abc0;->h6:I

    const-string v5, "EMOTICON_YEAH"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G3:I

    sget v3, Ll/abc0;->I:I

    sget v4, Ll/abc0;->J:I

    const-string v5, "EMOJI_16"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X3:I

    sget v3, Ll/abc0;->q0:I

    sget v4, Ll/abc0;->r0:I

    const-string v5, "EMOJI_45"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->R3:I

    sget v3, Ll/abc0;->e0:I

    sget v4, Ll/abc0;->f0:I

    const-string v5, "EMOJI_30"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N3:I

    sget v3, Ll/abc0;->W:I

    sget v4, Ll/abc0;->X:I

    const-string v5, "EMOJI_24"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T6:I

    sget v3, Ll/abc0;->S5:I

    sget v4, Ll/abc0;->T5:I

    const-string v5, "EMOTICON_UNDECIDED"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d8:I

    sget v3, Ll/abc0;->S2:I

    sget v4, Ll/abc0;->T2:I

    const-string v5, "NEW_EMOJI_SICK"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->n4:I

    sget v3, Ll/abc0;->V0:I

    sget v4, Ll/abc0;->W0:I

    const-string v5, "EMOJI_62"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->e8:I

    sget v3, Ll/abc0;->U2:I

    sget v4, Ll/abc0;->V2:I

    const-string v5, "NEW_EMOJI_SILENT"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O3:I

    sget v3, Ll/abc0;->Y:I

    sget v4, Ll/abc0;->Z:I

    const-string v5, "EMOJI_26"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l5:I

    sget v3, Ll/abc0;->Q3:I

    sget v4, Ll/abc0;->R3:I

    const-string v5, "EMOTICON_CONFUSED"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L4:I

    sget v3, Ll/abc0;->Q1:I

    sget v4, Ll/abc0;->R1:I

    const-string v5, "EMOJI_90"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->T3:I

    sget v3, Ll/abc0;->i0:I

    sget v4, Ll/abc0;->j0:I

    const-string v5, "EMOJI_40"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 204
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o8:I

    sget v3, Ll/abc0;->c3:I

    sget v4, Ll/abc0;->d3:I

    const-string v5, "NEW_EMOJI_VOMIT"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a8:I

    sget v3, Ll/abc0;->Q2:I

    sget v4, Ll/abc0;->R2:I

    const-string v5, "NEW_EMOJI_SHOCK"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H3:I

    sget v3, Ll/abc0;->K:I

    sget v4, Ll/abc0;->L:I

    const-string v5, "EMOJI_17"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 207
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K4:I

    sget v3, Ll/abc0;->O1:I

    sget v4, Ll/abc0;->P1:I

    const-string v5, "EMOJI_89"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I4:I

    sget v3, Ll/abc0;->K1:I

    sget v4, Ll/abc0;->L1:I

    const-string v5, "EMOJI_87"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M3:I

    sget v3, Ll/abc0;->U:I

    sget v4, Ll/abc0;->V:I

    const-string v5, "EMOJI_23"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->I3:I

    sget v3, Ll/abc0;->M:I

    sget v4, Ll/abc0;->N:I

    const-string v5, "EMOJI_18"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->b5:I

    sget v3, Ll/abc0;->A3:I

    sget v4, Ll/abc0;->B3:I

    const-string v5, "EMOTICON_BROKENHEART"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J4:I

    sget v3, Ll/abc0;->M1:I

    sget v4, Ll/abc0;->N1:I

    const-string v5, "EMOJI_88"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u5:I

    sget v3, Ll/abc0;->k4:I

    sget v4, Ll/abc0;->l4:I

    const-string v5, "EMOTICON_DISAPPOINTED"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F4:I

    sget v3, Ll/abc0;->E1:I

    sget v4, Ll/abc0;->F1:I

    const-string v5, "EMOJI_84"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 215
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->F3:I

    sget v3, Ll/abc0;->G:I

    sget v4, Ll/abc0;->H:I

    const-string v5, "EMOJI_15"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->N4:I

    sget v3, Ll/abc0;->U1:I

    sget v4, Ll/abc0;->V1:I

    const-string v5, "EMOJI_92"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->u4:I

    sget v3, Ll/abc0;->i1:I

    sget v4, Ll/abc0;->j1:I

    const-string v5, "EMOJI_73"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->x4:I

    sget v3, Ll/abc0;->o1:I

    sget v4, Ll/abc0;->p1:I

    const-string v5, "EMOJI_76"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y4:I

    sget v3, Ll/abc0;->q1:I

    sget v4, Ll/abc0;->r1:I

    const-string v5, "EMOJI_77"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->H4:I

    sget v3, Ll/abc0;->I1:I

    sget v4, Ll/abc0;->J1:I

    const-string v5, "EMOJI_86"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g6:I

    sget v3, Ll/abc0;->U4:I

    sget v4, Ll/abc0;->V4:I

    const-string v5, "EMOTICON_POOH_POOH"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B4:I

    sget v3, Ll/abc0;->w1:I

    sget v4, Ll/abc0;->x1:I

    const-string v5, "EMOJI_80"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 223
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->a4:I

    sget v3, Ll/abc0;->w0:I

    sget v4, Ll/abc0;->x0:I

    const-string v5, "EMOJI_48"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->X5:I

    sget v3, Ll/abc0;->I4:I

    sget v4, Ll/abc0;->J4:I

    const-string v5, "EMOTICON_MASK"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 225
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->j4:I

    sget v3, Ll/abc0;->O0:I

    sget v4, Ll/abc0;->P0:I

    const-string v5, "EMOJI_59"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t4:I

    sget v3, Ll/abc0;->g1:I

    sget v4, Ll/abc0;->h1:I

    const-string v5, "EMOJI_72"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v4:I

    sget v3, Ll/abc0;->k1:I

    sget v4, Ll/abc0;->l1:I

    const-string v5, "EMOJI_74"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->J3:I

    sget v3, Ll/abc0;->O:I

    sget v4, Ll/abc0;->P:I

    const-string v5, "EMOJI_19"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->p4:I

    sget v3, Ll/abc0;->Z0:I

    sget v4, Ll/abc0;->a1:I

    const-string v5, "EMOJI_65"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 230
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l4:I

    sget v3, Ll/abc0;->R0:I

    sget v4, Ll/abc0;->S0:I

    const-string v5, "EMOJI_60"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 231
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E4:I

    sget v3, Ll/abc0;->C1:I

    sget v4, Ll/abc0;->D1:I

    const-string v5, "EMOJI_83"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->M4:I

    sget v3, Ll/abc0;->S1:I

    sget v4, Ll/abc0;->T1:I

    const-string v5, "EMOJI_91"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->E3:I

    sget v3, Ll/abc0;->E:I

    sget v4, Ll/abc0;->F:I

    const-string v5, "EMOJI_14"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y3:I

    sget v3, Ll/abc0;->s0:I

    sget v4, Ll/abc0;->t0:I

    const-string v5, "EMOJI_46"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->D3:I

    sget v3, Ll/abc0;->C:I

    sget v4, Ll/abc0;->D:I

    const-string v5, "EMOJI_12"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o4:I

    sget v3, Ll/abc0;->X0:I

    sget v4, Ll/abc0;->Y0:I

    const-string v5, "EMOJI_63"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y7:I

    sget v3, Ll/abc0;->M2:I

    sget v4, Ll/abc0;->N2:I

    const-string v5, "NEW_EMOJI_SEDUCTION"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d6:I

    sget v3, Ll/abc0;->S4:I

    sget v4, Ll/abc0;->T4:I

    const-string v5, "EMOTICON_PEACE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 239
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B5:I

    sget v3, Ll/abc0;->i4:I

    sget v4, Ll/abc0;->j4:I

    const-string v5, "EMOTICON_FIST"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L3:I

    sget v3, Ll/abc0;->S:I

    sget v4, Ll/abc0;->T:I

    const-string v5, "EMOJI_21"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 241
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->P6:I

    sget v3, Ll/abc0;->M5:I

    sget v4, Ll/abc0;->N5:I

    const-string v5, "EMOTICON_THUMBS_UP"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 242
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->O6:I

    sget v3, Ll/abc0;->K5:I

    sget v4, Ll/abc0;->L5:I

    const-string v5, "EMOTICON_THUMBS_DOWN"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v6:I

    sget v3, Ll/abc0;->i5:I

    sget v4, Ll/abc0;->j5:I

    const-string v5, "EMOTICON_SHAKE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->G4:I

    sget v3, Ll/abc0;->G1:I

    sget v4, Ll/abc0;->H1:I

    const-string v5, "EMOJI_85"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 245
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->t7:I

    sget v3, Ll/abc0;->m3:I

    sget v4, Ll/abc0;->n3:I

    const-string v5, "NEW_EMOJI_BAOQUAN"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 246
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->l8:I

    sget v3, Ll/abc0;->Y2:I

    sget v4, Ll/abc0;->Z2:I

    const-string v5, "NEW_EMOJI_THS"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Q7:I

    sget v3, Ll/abc0;->y2:I

    sget v4, Ll/abc0;->z2:I

    const-string v5, "NEW_EMOJI_LIPS"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->o6:I

    sget v3, Ll/abc0;->K2:I

    sget v4, Ll/abc0;->L2:I

    const-string v5, "EMOTICON_ROSE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Z6:I

    sget v3, Ll/abc0;->a6:I

    sget v4, Ll/abc0;->b6:I

    const-string v5, "EMOTICON_WILT"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 250
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->v7:I

    sget v3, Ll/abc0;->a2:I

    sget v4, Ll/abc0;->b2:I

    const-string v5, "NEW_EMOJI_BEER"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 251
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i5:I

    sget v3, Ll/abc0;->K3:I

    sget v4, Ll/abc0;->L3:I

    const-string v5, "EMOTICON_COFFEE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->d5:I

    sget v3, Ll/abc0;->k3:I

    sget v4, Ll/abc0;->l3:I

    const-string v5, "EMOTICON_CAKE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 253
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->L7:I

    sget v3, Ll/abc0;->q2:I

    sget v4, Ll/abc0;->r2:I

    const-string v5, "NEW_EMOJI_GIFT"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->B7:I

    sget v3, Ll/abc0;->g2:I

    sget v4, Ll/abc0;->h2:I

    const-string v5, "NEW_EMOJI_CELEBRATE"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h4:I

    sget v3, Ll/abc0;->K0:I

    sget v4, Ll/abc0;->L0:I

    const-string v5, "EMOJI_57"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->g4:I

    sget v3, Ll/abc0;->I0:I

    sget v4, Ll/abc0;->J0:I

    const-string v5, "EMOJI_56"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 257
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w7:I

    sget v3, Ll/abc0;->c2:I

    sget v4, Ll/abc0;->d2:I

    const-string v5, "NEW_EMOJI_BLESSING"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 258
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h5:I

    sget v3, Ll/abc0;->I3:I

    sget v4, Ll/abc0;->J3:I

    const-string v5, "EMOTICON_CLEAVER"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 259
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->h6:I

    sget v3, Ll/abc0;->G2:I

    sget v4, Ll/abc0;->H2:I

    const-string v5, "EMOTICON_POOP"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 260
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->y7:I

    sget v3, Ll/abc0;->e2:I

    sget v4, Ll/abc0;->f2:I

    const-string v5, "NEW_EMOJI_BOMB"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K7:I

    sget v3, Ll/abc0;->o2:I

    sget v4, Ll/abc0;->p2:I

    const-string v5, "NEW_EMOJI_GET_RICH"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 262
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->V7:I

    sget v3, Ll/abc0;->I2:I

    sget v4, Ll/abc0;->J2:I

    const-string v5, "NEW_EMOJI_RED_ENVELOPES"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 263
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->i4:I

    sget v3, Ll/abc0;->M0:I

    sget v4, Ll/abc0;->N0:I

    const-string v5, "EMOJI_58"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->f4:I

    sget v3, Ll/abc0;->G0:I

    sget v4, Ll/abc0;->H0:I

    const-string v5, "EMOJI_54"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->A4:I

    sget v3, Ll/abc0;->u1:I

    sget v4, Ll/abc0;->v1:I

    const-string v5, "EMOJI_79"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->U7:I

    sget v3, Ll/abc0;->E2:I

    sget v4, Ll/abc0;->F2:I

    const-string v5, "NEW_EMOJI_PIGHEAD"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->w4:I

    sget v3, Ll/abc0;->m1:I

    sget v4, Ll/abc0;->n1:I

    const-string v5, "EMOJI_75"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->z4:I

    sget v3, Ll/abc0;->s1:I

    sget v4, Ll/abc0;->t1:I

    const-string v5, "EMOJI_78"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->K6:I

    sget v3, Ll/abc0;->E5:I

    sget v4, Ll/abc0;->F5:I

    const-string v5, "EMOTICON_SUN"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    new-instance v1, Ll/oze$a;

    sget v2, Lcom/p1/mobile/android/R$string;->Y5:I

    sget v3, Ll/abc0;->K4:I

    sget v4, Ll/abc0;->L4:I

    const-string v5, "EMOTICON_MOON"

    invoke-direct {v1, v5, v2, v3, v4}, Ll/oze$a;-><init>(Ljava/lang/String;III)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static final k(I)Ll/oze$a;
    .locals 3

    .line 1
    sget-object v0, Ll/oze;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/oze$a;

    .line 18
    .line 19
    iget v2, v1, Ll/oze$a;->b:I

    .line 20
    .line 21
    if-ne v2, p0, :cond_0

    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_1
    sget-object v0, Ll/oze;->b:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/oze$a;

    .line 41
    .line 42
    iget v2, v1, Ll/oze$a;->b:I

    .line 43
    .line 44
    if-ne v2, p0, :cond_2

    .line 45
    .line 46
    return-object v1

    .line 47
    :cond_3
    sget-object v0, Ll/oze;->c:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Ll/oze$a;

    .line 64
    .line 65
    iget v2, v1, Ll/oze$a;->b:I

    .line 66
    .line 67
    if-ne v2, p0, :cond_4

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_5
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method
