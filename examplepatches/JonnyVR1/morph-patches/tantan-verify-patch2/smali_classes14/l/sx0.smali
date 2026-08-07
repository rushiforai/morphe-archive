.class public final synthetic Ll/sx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(FLl/jl80;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/sx0;->a:F

    iput-object p2, p0, Ll/sx0;->b:Ll/jl80;

    iput-object p3, p0, Ll/sx0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/sx0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Ll/sx0;->a:F

    iget-object v1, p0, Ll/sx0;->b:Ll/jl80;

    iget-object v2, p0, Ll/sx0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/sx0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/tx0$a;->a(FLl/jl80;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
