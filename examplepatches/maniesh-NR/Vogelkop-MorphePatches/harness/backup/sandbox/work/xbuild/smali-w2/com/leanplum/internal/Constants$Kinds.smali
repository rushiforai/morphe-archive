.class public Lcom/leanplum/internal/Constants$Kinds;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Kinds"
.end annotation


# static fields
.field public static final ACTION:Ljava/lang/String; = "action"

.field public static final ARRAY:Ljava/lang/String; = "list"

.field public static final BOOLEAN:Ljava/lang/String; = "bool"

.field public static final COLOR:Ljava/lang/String; = "color"

.field public static final DICTIONARY:Ljava/lang/String; = "group"

.field public static final FILE:Ljava/lang/String; = "file"

.field public static final FLOAT:Ljava/lang/String; = "float"

.field public static final INT:Ljava/lang/String; = "integer"

.field public static final STRING:Ljava/lang/String; = "string"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
