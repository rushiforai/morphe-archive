.class public abstract Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;
.super Ly5i;
.source "SourceFile"


# static fields
.field public static final l:Lbpk;

.field public static final m:Lbpk;

.field public static final n:Lbpk;

.field public static final o:Lbpk;

.field public static final p:Lbpk;

.field public static final q:Lbpk;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lbpk;

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-direct {v0, v2, v3, v1}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->l:Lbpk;

    new-instance v0, Lbpk;

    const/4 v1, 0x1

    const/4 v2, 0x3

    invoke-direct {v0, v3, v2, v1}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->m:Lbpk;

    new-instance v0, Lbpk;

    const/4 v1, 0x2

    const/4 v3, 0x4

    invoke-direct {v0, v2, v3, v1}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->n:Lbpk;

    new-instance v0, Lbpk;

    const/4 v1, 0x3

    const/4 v2, 0x5

    invoke-direct {v0, v3, v2, v1}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->o:Lbpk;

    new-instance v0, Lbpk;

    const/4 v1, 0x4

    const/4 v3, 0x6

    invoke-direct {v0, v2, v3, v1}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->p:Lbpk;

    new-instance v0, Lbpk;

    const/4 v1, 0x7

    invoke-direct {v0, v3, v1, v2}, Lbpk;-><init>(IIB)V

    sput-object v0, Lcom/opera/android/suggested_sites/SuggestedSitesDatabase;->q:Lbpk;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ly5i;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract x()Lapk;
.end method
