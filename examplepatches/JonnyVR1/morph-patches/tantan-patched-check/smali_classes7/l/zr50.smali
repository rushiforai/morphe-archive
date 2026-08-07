.class public final synthetic Ll/zr50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zr50;->a:Ll/gs50;

    iput-object p2, p0, Ll/zr50;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/zr50;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/zr50;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zr50;->a:Ll/gs50;

    iget-object v1, p0, Ll/zr50;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/zr50;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/zr50;->d:Z

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p0, p1}, Ll/gs50;->x(Ll/gs50;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/util/List;)V

    return-void
.end method
