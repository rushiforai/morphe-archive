.class public final synthetic Ll/ass;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/abe0;

.field public final synthetic d:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ass;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/ass;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ass;->c:Ll/abe0;

    iput-object p4, p0, Ll/ass;->d:Ll/z20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ass;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/ass;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/ass;->c:Ll/abe0;

    iget-object p0, p0, Ll/ass;->d:Ll/z20;

    invoke-static {v0, v1, v2, p0}, Ll/fss;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;Ll/z20;)V

    return-void
.end method
