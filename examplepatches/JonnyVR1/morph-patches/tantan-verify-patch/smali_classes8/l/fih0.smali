.class public final synthetic Ll/fih0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fih0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/fih0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fih0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/fih0;->b:Ll/x20;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/uih0;->U(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
