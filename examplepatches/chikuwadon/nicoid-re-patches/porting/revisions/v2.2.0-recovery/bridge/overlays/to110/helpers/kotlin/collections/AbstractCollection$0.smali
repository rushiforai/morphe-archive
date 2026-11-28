.class public final synthetic Lkotlin/collections/AbstractCollection$0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lkotlin/collections/AbstractCollection;


# direct methods
.method public synthetic constructor <init>(Lkotlin/collections/AbstractCollection;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/collections/AbstractCollection$0;->f$0:Lkotlin/collections/AbstractCollection;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lkotlin/collections/AbstractCollection$0;->f$0:Lkotlin/collections/AbstractCollection;

    invoke-static {p0, p1}, Lkotlin/collections/AbstractCollection;->$r8$lambda$RRlQOBNvJqinm9A-K_sSPMZpvJY(Lkotlin/collections/AbstractCollection;Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method
