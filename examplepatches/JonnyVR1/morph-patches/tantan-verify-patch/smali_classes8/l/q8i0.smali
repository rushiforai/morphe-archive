.class public final synthetic Ll/q8i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e9i0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/e9i0;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8i0;->a:Ll/e9i0;

    iput-object p2, p0, Ll/q8i0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/q8i0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/q8i0;->d:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q8i0;->a:Ll/e9i0;

    iget-object v1, p0, Ll/q8i0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/q8i0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/q8i0;->d:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p0, p1}, Ll/e9i0;->R(Ll/e9i0;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    return-void
.end method
