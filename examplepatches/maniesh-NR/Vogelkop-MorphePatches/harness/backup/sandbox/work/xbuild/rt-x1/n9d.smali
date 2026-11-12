.class public final Ln9d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Luu1;

.field public final c:Landroid/content/res/AssetManager;

.field public final d:Lh42;

.field public final e:Ljava/util/LinkedHashMap;

.field public final f:Lqie;

.field public g:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ltcl;Luu1;Landroid/content/res/AssetManager;Loi3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln9d;->a:Ltcl;

    iput-object p2, p0, Ln9d;->b:Luu1;

    iput-object p3, p0, Ln9d;->c:Landroid/content/res/AssetManager;

    new-instance p1, Lh42;

    invoke-direct {p1}, Lh42;-><init>()V

    iput-object p1, p0, Ln9d;->d:Lh42;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p0, Ln9d;->e:Ljava/util/LinkedHashMap;

    new-instance p2, Lqie;

    const/16 p3, 0x13

    invoke-direct {p2, p3}, Lqie;-><init>(B)V

    iput-object p2, p0, Ln9d;->f:Lqie;

    new-instance p2, Lrkc;

    const/16 p3, 0xc

    invoke-direct {p2, p0, p3}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/16 p3, 0x8

    invoke-direct {p0, p2, p3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p4, p0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method
