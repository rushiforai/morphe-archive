.class public final synthetic Ll/dfm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ffm0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/ffm0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dfm0;->a:Ll/ffm0;

    iput-object p2, p0, Ll/dfm0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dfm0;->a:Ll/ffm0;

    iget-object p0, p0, Ll/dfm0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/ffm0;->k(Ll/ffm0;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
