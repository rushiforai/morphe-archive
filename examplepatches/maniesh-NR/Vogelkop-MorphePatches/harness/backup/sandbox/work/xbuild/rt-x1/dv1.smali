.class public final Ldv1;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lxln;

.field public final e:Lzwe;

.field public final f:Lg8j;

.field public final g:Lev1;

.field public final h:Ldxe;

.field public final i:Lyu1;


# direct methods
.method public constructor <init>(Lxln;Lzwe;Lg8j;Lcom/opera/android/settings/SettingsManager;Lev1;Ldxe;Lyu1;)V
    .registers 8

    invoke-direct {p0, p4, p3}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p1, p0, Ldv1;->d:Lxln;

    iput-object p2, p0, Ldv1;->e:Lzwe;

    iput-object p3, p0, Ldv1;->f:Lg8j;

    iput-object p5, p0, Ldv1;->g:Lev1;

    iput-object p6, p0, Ldv1;->h:Ldxe;

    iput-object p7, p0, Ldv1;->i:Lyu1;

    return-void
.end method


# virtual methods
.method public final f()Ld8j;
    .registers 1

    iget-object p0, p0, Ldv1;->f:Lg8j;

    return-object p0
.end method
