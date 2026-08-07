.class public final synthetic Ll/t7e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y7e0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/y7e0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7e0;->a:Ll/y7e0;

    iput-object p2, p0, Ll/t7e0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/t7e0;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t7e0;->a:Ll/y7e0;

    iget-object v1, p0, Ll/t7e0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/t7e0;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/y7e0;->g(Ll/y7e0;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    return-void
.end method
