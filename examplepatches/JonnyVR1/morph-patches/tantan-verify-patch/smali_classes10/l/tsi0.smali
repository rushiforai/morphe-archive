.class public final synthetic Ll/tsi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic a:Ll/vsi0;


# direct methods
.method public synthetic constructor <init>(Ll/vsi0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tsi0;->a:Ll/vsi0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tsi0;->a:Ll/vsi0;

    check-cast p1, Ljava/lang/String;

    check-cast p2, Ljava/lang/CharSequence;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-static {p0, p1, p2, p3}, Ll/vsi0;->a(Ll/vsi0;Ljava/lang/String;Ljava/lang/CharSequence;I)Landroid/text/SpannableStringBuilder;

    move-result-object p0

    return-object p0
.end method
