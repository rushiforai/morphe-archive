.class public final synthetic Ll/vzk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tcj;


# instance fields
.field public final synthetic a:Lv/VText_Expandable;


# direct methods
.method public synthetic constructor <init>(Lv/VText_Expandable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vzk0;->a:Lv/VText_Expandable;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vzk0;->a:Lv/VText_Expandable;

    check-cast p1, Ljava/lang/Float;

    check-cast p2, Landroid/view/animation/Transformation;

    check-cast p3, Ljava/lang/Integer;

    check-cast p4, Ljava/lang/Integer;

    invoke-static {p0, p1, p2, p3, p4}, Lv/VText_Expandable;->a(Lv/VText_Expandable;Ljava/lang/Float;Landroid/view/animation/Transformation;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
