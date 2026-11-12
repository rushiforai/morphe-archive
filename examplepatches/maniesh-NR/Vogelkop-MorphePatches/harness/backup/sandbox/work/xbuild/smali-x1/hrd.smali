.class public abstract Lhrd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Landroid/print/PrintAttributes$MediaSize;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    const-class v0, Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    array-length v3, v1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    array-length v3, v1

    const/4 v4, 0x0

    move v5, v4

    :goto_f
    if-ge v5, v3, :cond_37

    aget-object v6, v1, v5

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    const/16 v8, 0x18

    and-int/2addr v7, v8

    if-ne v7, v8, :cond_34

    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    if-ne v7, v0, :cond_34

    const/4 v7, 0x0

    :try_start_23
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/print/PrintAttributes$MediaSize;
    :try_end_29
    .catch Ljava/lang/IllegalAccessException; {:try_start_23 .. :try_end_29} :catch_34

    sget-object v7, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_LANDSCAPE:Landroid/print/PrintAttributes$MediaSize;

    if-eq v6, v7, :cond_34

    sget-object v7, Landroid/print/PrintAttributes$MediaSize;->UNKNOWN_PORTRAIT:Landroid/print/PrintAttributes$MediaSize;

    if-eq v6, v7, :cond_34

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :catch_34
    :cond_34
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    :cond_37
    new-array v0, v4, [Landroid/print/PrintAttributes$MediaSize;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/print/PrintAttributes$MediaSize;

    sput-object v0, Lhrd;->a:[Landroid/print/PrintAttributes$MediaSize;

    return-void
.end method
