.class public final synthetic Ll/n8w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n8w;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/n8w;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/n8w;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n8w;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/n8w;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/n8w;->c:Lkotlin/jvm/functions/Function0;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/haw;->K(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ll/uxj0;)V

    return-void
.end method
