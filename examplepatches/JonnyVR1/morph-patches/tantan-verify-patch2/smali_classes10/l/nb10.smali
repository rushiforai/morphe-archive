.class public final synthetic Ll/nb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/i6t;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/i6t;Lkotlin/jvm/functions/Function0;ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nb10;->a:Ll/i6t;

    iput-object p2, p0, Ll/nb10;->b:Lkotlin/jvm/functions/Function0;

    iput-boolean p3, p0, Ll/nb10;->c:Z

    iput-object p4, p0, Ll/nb10;->d:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nb10;->a:Ll/i6t;

    iget-object v1, p0, Ll/nb10;->b:Lkotlin/jvm/functions/Function0;

    iget-boolean v2, p0, Ll/nb10;->c:Z

    iget-object p0, p0, Ll/nb10;->d:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, v2, p0}, Ll/vb10;->b(Ll/i6t;Lkotlin/jvm/functions/Function0;ZLcom/p1/mobile/android/app/Act;)V

    return-void
.end method
