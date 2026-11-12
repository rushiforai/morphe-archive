.class public final Ldya;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Iterable;
.implements Lptb;


# static fields
.field public static final CREATOR:Laya;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Landroid/graphics/PointF;

.field public final c:Ljava/util/ArrayList;

.field public final d:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Laya;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ldya;->CREATOR:Laya;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/net/Uri;)V
    .registers 3

    .line 85
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    .line 86
    invoke-direct {p0, p1, v0}, Ldya;-><init>(Landroid/net/Uri;Landroid/graphics/PointF;)V

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Landroid/graphics/PointF;)V
    .registers 3

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Ldya;->a:Landroid/net/Uri;

    .line 89
    iput-object p2, p0, Ldya;->b:Landroid/graphics/PointF;

    .line 90
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ldya;->c:Ljava/util/ArrayList;

    .line 91
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ldya;->d:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 13

    const-class v0, Ldya;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-class v2, Landroid/net/Uri;

    invoke-static {p1, v1, v2}, Lkfo;->b0(Landroid/os/Parcel;Ljava/lang/ClassLoader;Ljava/lang/Class;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    if-nez v1, :cond_12

    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    :cond_12
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-class v2, Landroid/graphics/PointF;

    invoke-static {p1, v0, v2}, Lkfo;->b0(Landroid/os/Parcel;Ljava/lang/ClassLoader;Ljava/lang/Class;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/PointF;

    if-nez v0, :cond_25

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    :cond_25
    invoke-direct {p0, v1, v0}, Ldya;-><init>(Landroid/net/Uri;Landroid/graphics/PointF;)V

    iget-object v0, p0, Ldya;->d:Ljava/util/ArrayList;

    sget-object v1, Lfya;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    iget-object p1, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_36
    if-ge v1, v0, :cond_54

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lfya;

    new-instance v3, Lci7;

    const/4 v9, 0x0

    const/16 v10, 0xc

    const/4 v4, 0x1

    const-class v6, Ldya;

    const-string v7, "notifyChange"

    const-string v8, "notifyChange(Lcom/opera/hype/image/editor/ImageModel$Change;)V"

    move-object v5, p0

    invoke-direct/range {v3 .. v10}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v2, v3}, Lfya;->d(Lkotlin/jvm/functions/Function1;)V

    goto :goto_36

    :cond_54
    return-void
.end method


# virtual methods
.method public final b(Lfya;)V
    .registers 12

    iget-object v0, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4e

    new-instance v2, Lci7;

    const/4 v8, 0x0

    const/16 v9, 0xd

    const/4 v3, 0x1

    const-class v5, Ldya;

    const-string v6, "notifyChange"

    const-string v7, "notifyChange(Lcom/opera/hype/image/editor/ImageModel$Change;)V"

    move-object v4, p0

    invoke-direct/range {v2 .. v9}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {p1, v2}, Lfya;->d(Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Lq9a;

    const/16 v1, 0x17

    invoke-direct {p0, v1}, Lq9a;-><init>(B)V

    new-instance v1, Lq9a;

    const/16 v2, 0x18

    invoke-direct {v1, v2}, Lq9a;-><init>(B)V

    const/4 v2, 0x2

    new-array v2, v2, [Lkotlin/jvm/functions/Function1;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 p0, 0x1

    aput-object v1, v2, p0

    new-instance v1, Lvd3;

    invoke-direct {v1, v2, p0}, Lvd3;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    iget-object p0, v4, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_40
    if-ge v3, v0, :cond_4e

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Lit7;

    invoke-virtual {v1, p1}, Lit7;->a(Lfya;)V

    goto :goto_40

    :cond_4e
    return-void
.end method

.method public final c(Lfya;)V
    .registers 5

    iget-object v0, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lfya;->d(Lkotlin/jvm/functions/Function1;)V

    iget-object p0, p0, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_13
    if-ge v1, v0, :cond_21

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lit7;

    invoke-virtual {v2, p1}, Lit7;->c(Lfya;)V

    goto :goto_13

    :cond_21
    return-void
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 1

    iget-object p0, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    iget-object v0, p0, Ldya;->a:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Ldya;->b:Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object p0, p0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return-void
.end method
