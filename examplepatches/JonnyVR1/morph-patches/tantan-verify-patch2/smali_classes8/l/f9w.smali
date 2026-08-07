.class public final synthetic Ll/f9w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f9w;->a:Lkotlin/jvm/functions/Function0;

    iput-boolean p2, p0, Ll/f9w;->b:Z

    iput-object p3, p0, Ll/f9w;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/f9w;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/f9w;->e:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/f9w;->a:Lkotlin/jvm/functions/Function0;

    iget-boolean v1, p0, Ll/f9w;->b:Z

    iget-object v2, p0, Ll/f9w;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/f9w;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/f9w;->e:Lkotlin/jvm/functions/Function0;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/haw;->j(Lkotlin/jvm/functions/Function0;ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Ljava/lang/Throwable;)V

    return-void
.end method
